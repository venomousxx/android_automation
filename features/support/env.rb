require "appium_lib"

def caps
    { caps: {
        deviceName: "Pixel_2_API_27",
        platformName: "Android",
        app: "/Users/hardiansyah/Downloads/apk/PreciseUnitConversion.apk",
        appPackage: "com.ba.universalconverter",
        appActivity: "MainConverterActivity",
        newCommandTimeout: "3600"
    }}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
