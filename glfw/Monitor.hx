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
import cpp.RawPointer;
import cpp.Pointer;

//typedef GLFWmonitorfun = (Monitor, Int) -> cpp.Void;

@:keep
@:include("GLFW/glfw3.h")
@:native("GLFWmonitor *")
@:unreflective
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
//	static function setCallback(fn : ???) : ??? { return null; }

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