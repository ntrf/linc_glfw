package glfw;

import cpp.ConstCharStar;

typedef ErrorCb = (Int, String) -> Void;

@:enum abstract OpenGLProfile(Int) from Int to Int
{
	@:native("GLFW_OPENGL_ANY_PROFILE")
	var Any : Int = 0;
	@:native("GLFW_OPENGL_CORE_PROFILE")
	var Core : Int = 0x00032001;
	@:native("GLFW_OPENGL_COMPAT_PROFILE")
	var Compat : Int = 0x00032002;
}

@:enum abstract ClientApi(Int) from Int to Int
{
	@:native("GLFW_NO_API")
	var None : Int = 0;
	@:native("GLFW_OPENGL_API")
	var OpenGL : Int = 0x00030001;
	@:native("GLFW_OPENGL_ES_API")
	var OpenGLES : Int = 0x00030002;
}

@:unreflective
@:allow(glfw.GLFW)
private class GLFWErrorCallback
{
	static var errorCallback : ErrorCb = null;

	@:nonVirtual
	@:void
	static function cppHandler(v : cpp.Int32, s : cpp.ConstCharStar) : Void
	{
		if (errorCallback != null) {
			errorCallback(v, s.toString());
		}
	}
}

#if GLFW_INCLUDE_VULKAN
@:native("VkInstance")
@:unreflective
extern class GlfwVkInstance {}

@:native("VkPhysicalDevice")
@:unreflective
extern class GlfwVkPhysicalDevice {}

@:native("VkSurfaceKHR")
@:unreflective
extern class GlfwVkSurfaceKHR {}

typedef GlfwVkResult = Int;
#end

@:keep
@:include("GLFW/glfw3.h")
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml("glfw"))
#end
@:unreflective
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
	@:native("GLFW_SAMPLES")
	public static var SAMPLES : Int;
	@:native("GLFW_CLIENT_API")
	public static var CLIENT_API : Int;

	@:native("GLFW_FOCUSED")
	public static var FOCUSED : Int;      
	@:native("GLFW_ICONIFIED")
	public static var ICONIFIED : Int;
	@:native("GLFW_RESIZABLE")
	public static var RESIZEABLE : Int;
	@:native("GLFW_VISIBLE")
	public static var VISIBLE : Int;
	@:native("GLFW_DECORATED")
	public static var DECORATED : Int;
	@:native("GLFW_AUTO_ICONIFY")
	public static var AUTO_ICONIFY : Int;
	@:native("GLFW_FLOATING")
	public static var FLOATING : Int;
	@:native("GLFW_MAXIMIZED")
	public static var MAXIMIZED : Int;


	@:native("glfwInit")
	public static function init() : Int;

	@:native("glfwTerminate")
	public static function terminate() : Void;
	
	@:native("glfwPollEvents")
	public static function pollEvents() : Void;

	@:native("glfwWaitEvents")
	public static function waitEvents() : Void;

	@:native("glfwWaitEventsTimeout")
	public static function waitEventsTimeout(delay : cpp.Float64) : Void;

	@:native("glfwPostEmptyEvent")
	public static function postEmptyEvent() : Void;

	@:native("glfwWindowHint")
	static function hint(hint : Int, value : Int) : Void;

	@:native("glfwDefaultWindowHints")
	static function defaultHints() : Void;

	@:native("glfwGetVersionString")
	public static function getVersionString() : cpp.ConstCharStar;

	@:native("glfwGetTime")
	public static function getTime() : cpp.Float64;

	@:native("glfwSetTime")
	public static function setTime(v : cpp.Float64) : Void;

	@:native("glfwGetTimerValue")
	public static function getTimerValue() : cpp.UInt64;
	@:native("glfwGetTimerFrequency")
	public static function getTimerFrequency() : cpp.UInt64;

	@:native("glfwGetCurrentContext")
	public static function getCurrentContext() : Window;

	@:native("glfwSwapInterval")
	public static function swapInterval(interval : Int) : Void;

	@:native("glfwExtensionSupported")
	public static function isExtensionSupported(name : ConstCharStar) : Int;
	//@:native("glfwGetProcAddress")

	//### VK support needs some additional cpp-only code + SDK
	//    not sure how i'm going to hande it
	@:native("glfwVulkanSupported")
	public static function isVulkanSupported() : Int;
	@:native("glfwGetRequiredInstanceExtensions")
	public static function getRequiredInstanceExtensions(count : cpp.RawPointer<cpp.UInt32>) : cpp.RawPointer<ConstCharStar>;

#if GLFW_INCLUDE_VULKAN
	//@:native("glfwGetInstanceProcAddress")
	@:native("glfwGetPhysicalDevicePresentationSupport")
	public static function getPhysicalDevicePresentationSupport(
		instance : GlfwVkInstance, 
		device : GlfwVkPhysicalDevice,
		queuefamily : cpp.UInt32) : Int;
	@:native("glfwCreateWindowSurface")
	public static function createWindowSurface(
		instance : GlfwVkInstance, 
		window : Window, 
		allocator : cpp.RawConstPointer< cpp.Void >,
		surface : cpp.RawPointer< GlfwVkSurfaceKHR >) : GlfwVkResult;
#end

	// Error interface
	@:native("glfwSetErrorCallback")
	static function _i_setErrorCallback(fn: cpp.Callable< (cpp.Int32, cpp.ConstCharStar) -> Void >) : Void;

	public inline static function setErrorCallback(fn : ErrorCb) : Void
	{
		GLFW._i_setErrorCallback(
			if (fn != null) 
				cpp.Function.fromStaticFunction(GLFWErrorCallback.cppHandler)
			else
				null);
		GLFWErrorCallback.errorCallback = fn;
	}
}
