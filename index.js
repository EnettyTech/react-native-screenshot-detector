import { Alert } from 'react-native';
import { NativeModules, Platform, NativeEventEmitter } from 'react-native';

const { RnScreenShot } = NativeModules;
const SCREENSHOT_EVENT = 'ScreenshotTaken';
let eventEmitter = null;
/**
 * Disable action screenshot
 */
const DisableScreenShot = (cb) => new Promise((resolve, reject) => {
    try {
        if (Platform.OS === "android") {
            RnScreenShot.DisableScreenShot();
        } else {

            RnScreenShot.addListener(SCREENSHOT_EVENT)
            console.log("enable screenshot", RnScreenShot)
            eventEmitter = new NativeEventEmitter(RnScreenShot);
            eventEmitter.addListener(SCREENSHOT_EVENT, cb, {})
            resolve(eventEmitter)
        }
    } catch (error) {
        // alert(error)
    }
})

/**
 * Disable action screenshot
 */
const EnableScreenShot = () => new Promise((resolve, reject) => {
    try {
        if (Platform.OS === "android") {
            RnScreenShot.EnableScreenshot();
            resolve(null)
        } else {
            eventEmitter && eventEmitter.removeAllListeners(SCREENSHOT_EVENT);
        }
    } catch (error) {
        console.log(error)
    }
})

export {
    DisableScreenShot,
    EnableScreenShot
}
