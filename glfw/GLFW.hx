/*
 * Apache License, Version 2.0
 *
 * Copyright (c) 2019 Anton Nesterov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package glfw;

import cpp.ConstCharStar;

typedef ErrorCb = (Int, String) -> Void;

@:enum abstract KeyState(Int) from Int to Int
{
	/** The key or mouse button was released. */
	var RELEASE = 0;
	/** The key or mouse button was pressed. */
	var PRESS = 1;
	/** The key was held down until it repeated. */
	var REPEAT = 2;

	public function isDown() return this != RELEASE;
}

@:enum abstract Key(Int) from Int to Int
{
	var KEY_SPACE = 32;
	var KEY_APOSTROPHE = 39;  /* ' */
	var KEY_COMMA = 44;  /* , */
	var KEY_MINUS = 45;  /* - */
	var KEY_PERIOD = 46;  /* . */
	var KEY_SLASH = 47;  /* / */
	var KEY_0 = 48;
	var KEY_1 = 49;
	var KEY_2 = 50;
	var KEY_3 = 51;
	var KEY_4 = 52;
	var KEY_5 = 53;
	var KEY_6 = 54;
	var KEY_7 = 55;
	var KEY_8 = 56;
	var KEY_9 = 57;
	var KEY_SEMICOLON = 59;  /* ; */
	var KEY_EQUAL = 61;  /* = */
	var KEY_A = 65;
	var KEY_B = 66;
	var KEY_C = 67;
	var KEY_D = 68;
	var KEY_E = 69;
	var KEY_F = 70;
	var KEY_G = 71;
	var KEY_H = 72;
	var KEY_I = 73;
	var KEY_J = 74;
	var KEY_K = 75;
	var KEY_L = 76;
	var KEY_M = 77;
	var KEY_N = 78;
	var KEY_O = 79;
	var KEY_P = 80;
	var KEY_Q = 81;
	var KEY_R = 82;
	var KEY_S = 83;
	var KEY_T = 84;
	var KEY_U = 85;
	var KEY_V = 86;
	var KEY_W = 87;
	var KEY_X = 88;
	var KEY_Y = 89;
	var KEY_Z = 90;
	var KEY_LEFT_BRACKET = 91;  /* [ */
	var KEY_BACKSLASH = 92;  /* \ */
	var KEY_RIGHT_BRACKET = 93;  /* ] */
	var KEY_GRAVE_ACCENT = 96;  /* ` */
	var KEY_WORLD_1 = 161; /* non-US #1 */
	var KEY_WORLD_2 = 162; /* non-US #2 */

	/* Function keys */
	var KEY_ESCAPE = 256;
	var KEY_ENTER = 257;
	var KEY_TAB = 258;
	var KEY_BACKSPACE = 259;
	var KEY_INSERT = 260;
	var KEY_DELETE = 261;
	var KEY_RIGHT = 262;
	var KEY_LEFT = 263;
	var KEY_DOWN = 264;
	var KEY_UP = 265;
	var KEY_PAGE_UP = 266;
	var KEY_PAGE_DOWN = 267;
	var KEY_HOME = 268;
	var KEY_END = 269;
	var KEY_CAPS_LOCK = 280;
	var KEY_SCROLL_LOCK = 281;
	var KEY_NUM_LOCK = 282;
	var KEY_PRINT_SCREEN = 283;
	var KEY_PAUSE = 284;
	var KEY_F1 = 290;
	var KEY_F2 = 291;
	var KEY_F3 = 292;
	var KEY_F4 = 293;
	var KEY_F5 = 294;
	var KEY_F6 = 295;
	var KEY_F7 = 296;
	var KEY_F8 = 297;
	var KEY_F9 = 298;
	var KEY_F10 = 299;
	var KEY_F11 = 300;
	var KEY_F12 = 301;
	var KEY_F13 = 302;
	var KEY_F14 = 303;
	var KEY_F15 = 304;
	var KEY_F16 = 305;
	var KEY_F17 = 306;
	var KEY_F18 = 307;
	var KEY_F19 = 308;
	var KEY_F20 = 309;
	var KEY_F21 = 310;
	var KEY_F22 = 311;
	var KEY_F23 = 312;
	var KEY_F24 = 313;
	var KEY_F25 = 314;
	var KEY_KP_0 = 320;
	var KEY_KP_1 = 321;
	var KEY_KP_2 = 322;
	var KEY_KP_3 = 323;
	var KEY_KP_4 = 324;
	var KEY_KP_5 = 325;
	var KEY_KP_6 = 326;
	var KEY_KP_7 = 327;
	var KEY_KP_8 = 328;
	var KEY_KP_9 = 329;
	var KEY_KP_DECIMAL = 330;
	var KEY_KP_DIVIDE = 331;
	var KEY_KP_MULTIPLY = 332;
	var KEY_KP_SUBTRACT = 333;
	var KEY_KP_ADD = 334;
	var KEY_KP_ENTER = 335;
	var KEY_KP_EQUAL = 336;
	var KEY_LEFT_SHIFT = 340;
	var KEY_LEFT_CONTROL = 341;
	var KEY_LEFT_ALT = 342;
	var KEY_LEFT_SUPER = 343;
	var KEY_RIGHT_SHIFT = 344;
	var KEY_RIGHT_CONTROL = 345;
	var KEY_RIGHT_ALT = 346;
	var KEY_RIGHT_SUPER = 347;
	var KEY_MENU = 348;

	var KEY_LAST = KEY_MENU;
}

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
