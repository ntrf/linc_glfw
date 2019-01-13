package glfw;

import cpp.vm.Gc;
import cpp.RawPointer;
import cpp.Pointer;

// Callbacks
typedef PosCb = (Window, cpp.Int32, cpp.Int32) -> cpp.Void;
typedef SizeCb = (Window, cpp.Int32, cpp.Int32) -> cpp.Void;
typedef CloseCb = (Window) -> cpp.Void;
typedef RefreshCb = (Window) -> cpp.Void;
typedef FocusCb = (Window, cpp.Int32) -> cpp.Void;
typedef IconifyCb = (Window, cpp.Int32) -> cpp.Void;
typedef FramebufferSizeCb = (Window, cpp.Int32, cpp.Int32) -> cpp.Void;
typedef MouseButtonCb = (Window, cpp.Int32, cpp.Int32, cpp.Int32) -> cpp.Void;
typedef CursorPosCb = (Window, cpp.Float64, cpp.Float64) -> cpp.Void;
typedef CursorEnterCb = (Window, cpp.Int32) -> cpp.Void;
typedef ScrollCb = (Window, cpp.Float64, cpp.Float64) -> cpp.Void;
typedef KeyCb = (Window, cpp.Int32, cpp.Int32, cpp.Int32, cpp.Int32) -> cpp.Void;
typedef CharCb = (Window, cpp.UInt32) -> cpp.Void;
typedef CharModsCb = (Window, cpp.UInt32, cpp.Int32) -> cpp.Void;
typedef DropCb = (Window, cpp.Int32, cpp.ConstCharStar) -> cpp.Void;

//### Current implementation can only exist in non-reflective classes. It also violates the C++ 
// standart, as it assumes, that ``this`` pointer is a value of pointer to a different class.
// Possible resolutions: (a) change to abstract, (b) change to container object, (c) find hxcpp 
// examples, that implement something simmilar.

@:keep
@:include("GLFW/glfw3.h")
@:native("GLFWwindow *")
@:unreflective
extern class Window
{
	@:native("glfwMakeContextCurrent")
	static function _internal_makeCurrent(win : Window) : Void {}

	@:native("glfwWindowShouldClose")
	static function _internal_shouldClose(win : Window) : Int { return false; }

	@:native("glfwSetWindowShouldClose")
	static function _internal_setShouldClose(win : Window, v : Int) : Void {}

	@:native("glfwSwapBuffers")
	static function _internal_swapBuffers(win : Window) : Void { }

	@:native("glfwDestroyWindow")
	static function _i_destroy(win : Window) : Void { }

	@:native("glfwShowWindow")
	static function _i_show(win : Window) : Void { }
	@:native("glfwHideWindow")
	static function _i_hide(win : Window) : Void { }
	@:native("glfwIconifyWindow")
	static function _i_iconify(win : Window) : Void { }
	@:native("glfwRestoreWindow")
	static function _i_restore(win : Window) : Void { }
	@:native("glfwMaximizeWindow")
	static function _i_maximize(win : Window) : Void { }
	@:native("glfwFocusWindow")
	static function _i_focus(win : Window) : Void { }

	@:native("glfwGetWindowSize")
	static function _i_getSize(win : Window, width : RawPointer<Int>, height : RawPointer<Int>) : Void { }
	@:native("glfwSetWindowSize")
	static function _i_setSize(win : Window, width : Int, height : Int) : Void { }

	@:native("glfwGetWindowPos")
	static function _i_getPos(win : Window, xpos : RawPointer<Int>, ypos : RawPointer<Int>) : Void { }
	@:native("glfwSetWindowPos")
	static function _i_setPos(win : Window, xpos : Int, ypos : Int) : Void { }

	@:native("glfwGetFramebufferSize")
	static function _i_getFramebufferSize(win : Window, width : RawPointer<Int>, height : RawPointer<Int>) : Void { }

	//@:native("glfwSetWindowTitle")
	//@:native("glfwSetWindowIcon")
	//@:native("glfwSetWindowSizeLimits")
	//@:native("glfwSetWindowAspectRatio")
	//@:native("glfwGetWindowFrameSize")
	//@:native("glfwGetWindowMonitor")
	//@:native("glfwSetWindowMonitor")
	@:native("glfwGetWindowAttrib")
	static function _i_getAttrib(win : Window, attr : Int) : Int { return 0; }

	//### I'm not sure how to abstract these
	@:native("glfwGetWindowUserPointer")
	static function _i_getUserPointer(win : Window) : RawPointer<cpp.Void> { return null; }
	@:native("glfwSetWindowUserPointer")
	static function _i_setUserPointer(win : Window, ptr : RawPointer<cpp.Void>) : Void {}

	//### ???
	//@:native("glfwSetWindowPosCallback")
	//static function _i_setPosCallback(win : Window, fn : cpp.Function< (Window, Int, Int) -> Void >) : Void {}
	//@:native("glfwSetWindowSizeCallback")
	//@:native("glfwSetWindowCloseCallback")
	//@:native("glfwSetWindowRefreshCallback")
	//@:native("glfwSetWindowFocusCallback")
	//@:native("glfwSetWindowIconifyCallback")
	//@:native("glfwSetFramebufferSizeCallback")
	//@:native("glfwSetKeyCallback")
	//@:native("glfwSetCharCallback")
	//@:native("glfwSetCharModsCallback")
	//@:native("glfwSetMouseButtonCallback")
	//@:native("glfwSetCursorPosCallback")
	//@:native("glfwSetCursorEnterCallback")
	//@:native("glfwSetScrollCallback")
	//@:native("glfwSetDropCallback")


	//@:native("glfwGetInputMode")
	//@:native("glfwSetInputMode")
	//@:native("glfwGetKeyName")
	//@:native("glfwGetKey")
	//@:native("glfwGetMouseButton")
	//@:native("glfwGetCursorPos")
	//@:native("glfwSetCursorPos")

	//@:native("glfwSetCursor")

	//@:native("glfwSetClipboardString")
	//@:native("glfwGetClipboardString")

	@:native("glfwCreateWindow")
	@:hide
	private static function _internal_createWindow(width : Int, height : Int, title : cpp.ConstCharStar, 
		monitor : cpp.RawPointer<cpp.Void>, share : cpp.RawPointer<cpp.Void>) : Window
	{ return null; }
	
	public inline static function createWindow(width : Int, height : Int, title : String) : Window
	{
		var ptr = _internal_createWindow(width, height, title, null, null);
		return ptr;
	}

	public inline function destroy() : Void {
		_i_destroy(this);
	}

	public inline function focus() : Void { _i_focus(this); }
	public inline function show() : Void { _i_show(this); }
	public inline function hide() : Void { _i_hide(this); }
	public inline function iconify() : Void { _i_iconify(this); }
	public inline function restore() : Void { _i_restore(this); }
	public inline function maximize() : Void { _i_maximize(this); }

	public inline function setSize(width : Int, height : Int) : Void { _i_setSize(this, width, height); }
	public inline function getSize() : Array< Int > {
		var res : Array< Int > = [0, 0];
		_i_getSize(this, 
			Pointer.arrayElem(res, 0).raw,
			Pointer.arrayElem(res, 1).raw);
		return res;
	}

	public inline function setPos(x : Int, y : Int) : Void { 
		_i_setPos(this, x, y); 
	}
	public inline function getPos() : Array< Int > {
		var res = [0, 0];
		_i_getPos(this, 
			Pointer.arrayElem(res, 0).raw,
			Pointer.arrayElem(res, 1).raw);
		return res;
	}

	public inline function getFramebufferSize() : Array< Int > {
		var res = [0, 0];
		_i_getFramebufferSize(this, 
			Pointer.arrayElem(res, 0).raw,
			Pointer.arrayElem(res, 1).raw);
		return res;
	}

	public inline function shouldClose() : Bool return _internal_shouldClose(this) != 0;
	public inline function setShouldClose(v : Bool) : Void { _internal_setShouldClose(this, v ? 0 : 1); }

	public inline function makeCurrent() : Void return _internal_makeCurrent(this);
	public inline function swapBuffers() : Void return _internal_swapBuffers(this);

	public var isFocused(get, never) : Bool;
	public inline function get_isFocused() : Bool return _i_getAttrib(this, GLFW.FOCUSED) != 0;
	public var isVisible(get, never) : Bool;
	public inline function get_isVisible() : Bool return _i_getAttrib(this, GLFW.VISIBLE) != 0;

	public inline function setPosCallback(fn : (Window, Int, Int) -> Void) : Void
	{
		
	}
}
