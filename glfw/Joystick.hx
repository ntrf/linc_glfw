package glfw;

import cpp.ConstCharStar;
import cpp.RawPointer;
import cpp.Pointer;

@:keep
@:include("GLFW/glfw3.h")
@:native("GLFWmonitor *")
extern class Monitor
{
	@:native("glfwJoystickPresent")
	public static function isPresent(id : Int) : Int { return 0; }

	//@:native("glfwGetJoystickAxes")
	//@:native("glfwGetJoystickButtons")
	@:native("glfwGetJoystickName")
	public static function getName(id : Int) : ConstCharStar { return null; }
	//@:native("glfwSetJoystickCallback")
}