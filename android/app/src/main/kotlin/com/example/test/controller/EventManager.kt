package com.example.test.controller

import io.flutter.plugin.common.EventChannel

class EventManager {
    companion object {
        private const val EVENT_DPAD = "androidType=%s,~direction=%d"
    }

    private var eventSink: EventChannel.EventSink? = null

    fun setEventSink(eventSink: EventChannel.EventSink?){
        this.eventSink = eventSink
    }

    fun sendDpadEvent(direction: Int){
        eventSink?.success("androidType=${ControllerKeysData.DPAD},~direction=$direction")
    }

    fun sendAxisEvent(source: ControllerKeysData, axisName: String, xValue: Float = 0f, yValue: Float = 0f){
        eventSink?.success("androidType=${ControllerKeysData.AXIS},~sourceInput=$source,~axisType=$axisName,~x=$xValue,~y=$yValue")
    }

    fun sendButtonEvent(action: String, code: Int){
        eventSink?.success("androidType=${ControllerKeysData.BUTTON},~keyAction=$action,~keyCode=$code")
    }
}
