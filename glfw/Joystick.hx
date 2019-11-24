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

//typedef GLFWjoystickfun = (Int, Int) -> cpp.Void;

@:keep
@:include("GLFW/glfw3.h")
@:unreflective
extern class Joystick
{
	@:native("glfwJoystickPresent")
	public static function isPresent(id : Int) : Int { return 0; }

	//@:native("glfwGetJoystickAxes")
	//@:native("glfwGetJoystickButtons")
	@:native("glfwGetJoystickName")
	public static function getName(id : Int) : ConstCharStar { return null; }
	//@:native("glfwSetJoystickCallback")
}