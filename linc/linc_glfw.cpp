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
