#!/usr/bin/xcrun swift

import Foundation

// Structs
struct AppInfo {
	var buildNumber: String
	var versionNumber: String

	init(dictionary: NSMutableDictionary) {
		buildNumber = dictionary["CFBundleShortVersionString"] as! String
		versionNumber = dictionary["CFBundleVersion"] as! String
	}
}

struct Image {
	var idiom: String = ""
	var scale: String = ""
	var size: String = ""
	var height: String = ""
	var width: String = ""
	var filename: String?

	init(dictionary: AnyObject) {
		idiom = dictionary["idiom"] as! String
		scale = dictionary["scale"] as! String
		size = dictionary["size"] as! String
		height = size.componentsSeparatedByString("x")[0]
		width = size.componentsSeparatedByString("x")[1]
		filename = dictionary["filename"] as? String
	}
}

// Functions

// Extensions
extension NSMutableDictionary {
	func mutateDictionaryWithAppInfo(appInfo: AppInfo) -> NSMutableDictionary {
		let pre = self["PreferenceSpecifiers"]
		let obj = pre![1]
		obj.setObject("\(appInfo.versionNumber) (\(appInfo.buildNumber))", forKey: "DefaultValue")
		pre!.replaceObjectAtIndex(1, withObject:obj)
		self.setObject(pre!, forKey: "PreferenceSpecifiers")
		return self
	}
}

extension NSDirectoryEnumerator {
	func pathForPlistWithEnumerator(name: String = ".plist") -> String {
		while let element = self.nextObject() as? String {
			if element.hasSuffix(name) {
				return element
			}
		}
		return ""
	}
}

extension NSData {
	func imageArrayWithDictionary() -> [Image] {
		var images = [Image]()
		do {
		  	let object = try NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.MutableContainers) as? [String: AnyObject]
			if let objects = object!["images"] as? [AnyObject] {
				for img in objects  {
					images.append(Image(dictionary: img))
				}
			}
		} catch let caught as NSError {
		  	print(caught)
		}
		return images
	}
}

func shell(input: String) -> (output: String, exitCode: Int32) {
    let arguments = input.characters.split { $0 == " " }.map(String.init)

    let task = NSTask()
    task.launchPath = "/usr/bin/env"
    task.arguments = arguments
    task.environment = [
        "LC_ALL" : "en_US.UTF-8",
		"PATH" : "/usr/local/bin",
    ]

    let pipe = NSPipe()
    task.standardOutput = pipe
    task.launch()
    task.waitUntilExit()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output: String = NSString(data: data, encoding: NSUTF8StringEncoding) as! String

    return (output, task.terminationStatus)
}


func main(backgroundColor: String = "#0000", fillColor: String = "black") {
	let fileManager = NSFileManager.defaultManager()
	let plistFileName = fileManager.enumeratorAtPath(fileManager.currentDirectoryPath)!.pathForPlistWithEnumerator()
	let appIconJson = fileManager.enumeratorAtPath(fileManager.currentDirectoryPath)!.pathForPlistWithEnumerator("AppIcon.appiconset/Contents.json")
	let images = NSData(contentsOfFile: appIconJson)!.imageArrayWithDictionary()
	let appInfo = AppInfo(dictionary: NSMutableDictionary(contentsOfFile: plistFileName)!)

	for image in images {
		if let filename = image.filename {
			let basefile = "Assets.xcassets/AppIcon.appiconset/\(filename)"
			let command = "convert -background \(backgroundColor) -fill \(fillColor) -gravity center -size \(image.size) caption:\(appInfo.versionNumber) \(basefile) +swap -gravity south -composite \(basefile)"
			shell(command)
		}
	}
}

if Process.arguments.count < 3 {
	main()
} else {
	main(Process.arguments[1], fillColor: Process.arguments[2])
}
