package glfw;

import cpp.ConstCharStar;
import cpp.RawPointer;
import cpp.Pointer;

@:keep
@:include("GLFW/glfw3.h")
@:native("GLFWmonitor *")
extern class Monitor
{
	@:native("glfwGetMonitors")
	static function _i_getMonitors(count : RawPointer< Int >) : RawPointer<Monitor> { return null; }

	@:native("glfwGetPrimaryMonitor")
	public static function getPrimary() : Monitor { return null; }

	@:native("glfwGetMonitorPos")
	static function _i_getPos(mon : Monitor, xpos : RawPointer< Int >, ypos : RawPointer< Int >) : Void {}
	
	@:native("glfwGetMonitorPhysicalSize")
	static function _i_getPhysicalSize(mon : Monitor, xpos : RawPointer< Int >, ypos : RawPointer< Int >) : Void {}

	@:native("glfwGetMonitorName")
	public static function getName(mon : Monitor) : ConstCharStar { return null; }
	
//	@:native("glfwSetMonitorCallback")
//	static function setCallback(mon : Monitor, fn : ???) : ??? { return null; }

//	@:native("glfwGetVideoModes")
//	static function getVideoModes(mon : Monitor, count : RawPointer< Int >) : RawPointer< VideoMode > { return null; }
//	@:native("glfwGetVideoMode")
//	static function _i_getVideoMode(mon : Monitor) : RawPointer< VideoMode > return null;

	@:native("glfwSetGamma")
	public static function _i_setGamma(mon : Monitor, gamma : cpp.Float32) : Void { }
//	@:native("glfwGetGammaRamp")
//	public static function _i_getGammaRamp(mon : Monitor) : RawPointer<GammaRamp> { return null; }
//	@:native("glfwSetGammaRamp")
//	public static function _i_setGammaRamp(mon : Monitor, ramp : RawConstPointer<GammaRamp>) : Void {}

	//### WIP
	//### needs wrappers for array access functions
}