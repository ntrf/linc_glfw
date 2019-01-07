package glfw;

import cpp.Pointer;

@:keep
@:include("GLFW/glfw3.h")
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml("glfw"))
#end
@:native("GLFWwindow *")
extern class Window
{
	@:native("glfwInit")
	public static function init() : Void {}

	@:native("glfwTerminate")
	public static function terminate() : Void {}
	
	@:native("glfwPollEvents")
	public static function pollEvents() : Void {}

	@:native("glfwMakeContextCurrent")
	static function _internal_makeCurrent(win : Window) : Void {}

	@:native("glfwWindowShouldClose")
	static function _internal_shouldClose(win : Window) : Bool { return false; }

	@:native("glfwSwapBuffers")
	static function _internal_swapBuffers(win : Window) : Void { }

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

	public inline function shouldClose() : Bool return _internal_shouldClose(this);
	public inline function makeCurrent() : Void return _internal_makeCurrent(this);
	public inline function swapBuffers() : Void return _internal_swapBuffers(this);
	
//	@:native('linc::empty::example')
//	static function example() : Int;

	//inline functions can be used as wrappers
	//and can be useful to juggle haxe typing to or from the c++ extern

//	@:native('linc::empty::example')
//	private static function _internal_example() : Int;
//	static inline function other_inline_example() : Int {
//		return _internal_example();
//	}

	
	
}
