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
#include <hxcpp.h>

#include "GLFW/glfw3.h"

namespace linc 
{
	namespace empty 
	{
		struct Listener
		{
			cpp::Function< void(int, int) > PosCb;
			cpp::Function< void(int, int) > SizeCb;
			cpp::Function< void() > CloseCb;	
			cpp::Function< void() > RefreshCb;
			cpp::Function< void(int) > FocusCb;
			cpp::Function< void(int) > IconifyCb;
			cpp::Function< void(int, int) > FramebufferSizeCb;
			cpp::Function< void(int, int, int) > MouseButtonCb;
			cpp::Function< void(double, double) > CursorPosCb;
			cpp::Function< void(int) > CursorEnterCb;
			cpp::Function< void(double, double) >  ScrollCb;
			cpp::Function< void(int, int, int, int) > KeyCb;
			cpp::Function< void(unsigned int) > CharCb;
			cpp::Function< void(unsigned int, int) > CharModsCb;
			//cpp::Function< void(int, const char **) > DropCb;  // This needs array of strings
		};


		void installWindowListener(GLFWwindow * w) {

			//glfwCreateWindow
		}
	}
}
