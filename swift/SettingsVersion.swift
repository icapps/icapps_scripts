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

func main() {
	let fileManager = NSFileManager.defaultManager()
	let plistFileName = fileManager.enumeratorAtPath(fileManager.currentDirectoryPath)!.pathForPlistWithEnumerator()
	let settingsFileName = fileManager.enumeratorAtPath(fileManager.currentDirectoryPath)!.pathForPlistWithEnumerator("Root.plist")
	let appInfo = AppInfo(dictionary: NSMutableDictionary(contentsOfFile: plistFileName)!)

	if let dictionary = NSMutableDictionary(contentsOfFile: settingsFileName) {
		dictionary.mutateDictionaryWithAppInfo(appInfo).writeToFile(settingsFileName, atomically: true)
	}
}

main()
