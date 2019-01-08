package glfw;

import cpp.ConstCharStar;
@:enum abstract OpenGLProfile(Int) from Int to Int
{
	@:native("GLFW_OPENGL_CORE_PROFILE")
	var Core : Int;
	@:native("GLFW_OPENGL_COMPAT_PROFILE")
	var Compat : Int;
}

@:keep
@:include("GLFW/glfw3.h")
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml("glfw"))
#end
extern class GLFW
{
	@:native("GLFW_CONTEXT_VERSION_MAJOR")
	public static var CONTEXT_VERSION_MAJOR : Int;
	@:native("GLFW_CONTEXT_VERSION_MINOR")
	public static var CONTEXT_VERSION_MINOR : Int;
	@:native("GLFW_CONTEXT_REVISION")
	public static var CONTEXT_REVISION : Int;
	@:native("GLFW_CONTEXT_ROBUSTNESS")
	public static var CONTEXT_ROBUSTNESS : Int;
	@:native("GLFW_OPENGL_FORWARD_COMPAT")
	public static var OPENGL_FORWARD_COMPAT : Int;
	@:native("GLFW_OPENGL_DEBUG_CONTEXT")
	public static var OPENGL_DEBUG_CONTEXT : Int;
	@:native("GLFW_OPENGL_PROFILE")
	public static var OPENGL_PROFILE : Int;

	@:native("glfwInit")
	public static function init() : Void {}

	@:native("glfwTerminate")
	public static function terminate() : Void {}
	
	@:native("glfwPollEvents")
	public static function pollEvents() : Void {}

	@:native("glfwWaitEvents")
	public static function waitEvents() : Void {}

	@:native("glfwWaitEventsTimeout")
	public static function waitEventsTimeout(delay : cpp.Float64) : Void {}

	@:native("glfwPostEmptyEvent")
	public static function postEmptyEvent() : Void {}

	@:native("glfwWindowHint")
	static function hint(hint : Int, value : Int) : Void {}

	@:native("glfwDefaultWindowHints")
	static function defaultHints() : Void {}

	@:native("glfwGetVersionString")
	public static function getVersionString() : cpp.ConstCharStar {}

	@:native("glfwGetTime")
	public static function getTime() : cpp.Float64 {}

	@:native("glfwSetTime")
	public static function setTime(v : cpp.Float64) : Void {}

	@:native("glfwGetTimerValue")
	public static function getTimerValue() : cpp.UInt64 {}
	@:native("glfwGetTimerFrequency")
	public static function getTimerFrequency() : cpp.UInt64 {}

	@:native("glfwGetCurrentContext")
	public static function getCurrentContext() : Window {}

	@:native("glfwSwapInterval")
	public static function swapInterval(interval : Int) : Void {}

	@:native("glfwExtensionSupported")
	public static function isExtensionSupported(name : ConstCharStar) : Int {}
	//@:native("glfwGetProcAddress")

	//### VK support needs some additional cpp-only code + SDK
	//    not sure how i'm going to hande it
	@:native("glfwVulkanSupported")
	public static function isVulkanSupported() : Int {}
	//@:native("glfwGetRequiredInstanceExtensions")
	//@:native("glfwGetInstanceProcAddress")
	//@:native("glfwGetPhysicalDevicePresentationSupport")
	//@:native("glfwCreateWindowSurface")
}
