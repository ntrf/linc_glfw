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

@:allow(glfw.Window)
class Listener extends cpp.Finalizable
{
	var userData : Dynamic;
	var window : Window;

	var onWindowPos : (x: Int, y : Int) -> Void = null;
	var onWindowSize : (width : Int, height : Int) -> Void = null;
	var onWindowClose : () -> Void = null;
	var onWindowRefresh : () -> Void = null;
	var onWindowFocus : (focused : Int) -> Void = null;
	var onWindowIconify : (state : Int) -> Void = null;
	var onFramebufferSize : (width : Int, height : Int) -> Void = null;
	var onMouseButton : (button : Int, action : Int, mods : Int) -> Void = null;
	var onCursorPos : (xpos : Float, ypos : Float) -> Void = null;
	var onCursorEnter : (entered : Int) -> Void = null;
	var onScroll : (xscroll : Float, yscroll : Float) -> Void = null;
	var onKey : (key : Int, scancode : Int, action : Int, mods : Int) -> Void = null;
	var onChar : (char : Int) -> Void = null;
	var onCharMods : (char : Int, mods : Int) -> Void = null;
	var onDrop : (paths : Array< String >) -> Void = null;

	//### This is not very efficient. Alternatives:
	// - use window user data to index the listener
	// - place a pointer with GC root into the user data
	// - encode event params and then replay them with haxe callbacks
	static var listeners : Map< Window, Listener > = new Map();

	public static function create(w : Window) {
		var l = new Listener();
		l.window = w;
		listeners.set(w, l);
		return l;
	}
	public static function destroy(w : Window) {
		listeners.remove(w);
	}
	public static function get(w : Window) : Listener {
		return listeners.get(w);
	}

	override function finalize()
	{
		// Not needed for a weak ref
		//listeners.remove(window);
	}

	@:void static function cppWindowPos(w : Window, x : cpp.Int32, y : cpp.Int32) { ListenerMacro.callHaxe("WindowPos", x, y); }
	@:void static function cppWindowSize(w : Window, x : cpp.Int32, y : cpp.Int32) { ListenerMacro.callHaxe("WindowSize", x, y); }
	@:void static function cppWindowClose(w : Window) { ListenerMacro.callHaxe("WindowClose"); }
	@:void static function cppWindowRefresh(w : Window) { ListenerMacro.callHaxe("WindowRefresh"); }
	@:void static function cppWindowFocus(w : Window, f : cpp.Int32) { ListenerMacro.callHaxe("WindowFocus", f); }
	@:void static function cppWindowIconify(w : Window, a : cpp.Int32) { ListenerMacro.callHaxe("WindowIconify", a); }
	@:void static function cppFramebufferSize(w: Window, a: cpp.Int32, b:cpp.Int32) { ListenerMacro.callHaxe("FramebufferSize", a, b); }
	@:void static function cppMouseButton(w : Window, a: cpp.Int32, b:cpp.Int32, c:cpp.Int32) { ListenerMacro.callHaxe("MouseButton", a, b, c); }
	@:void static function cppCursorPos(w : Window, a: cpp.Float64, b:cpp.Float64) { ListenerMacro.callHaxe("CursorPos", a, b); }
	@:void static function cppCursorEnter(w : Window, a: cpp.Int32) { ListenerMacro.callHaxe("CursorEnter", a); }
	@:void static function cppScroll(w : Window, a: cpp.Float64, b:cpp.Float64) { ListenerMacro.callHaxe("Scroll", a, b); }
	@:void static function cppKey(w : Window, a: cpp.Int32, b:cpp.Int32, c:cpp.Int32, d:cpp.Int32) { ListenerMacro.callHaxe("Key", a, b, c, d); }
	@:void static function cppChar(w : Window, a: cpp.UInt32) { ListenerMacro.callHaxe("Char", a); }
	@:void static function cppCharMods(w : Window, a: cpp.UInt32, b:cpp.Int32) { ListenerMacro.callHaxe("CharMods", a, b); }
	@:void static function cppDrop(w : Window, a: cpp.Int32, b:cpp.RawPointer< cpp.ConstCharStar >) {
		var res = [];
		for (i in 0 ... a) { res[i] = b[i].toString(); }
		ListenerMacro.callHaxe("Drop", res);
	}

	function new() {
		super();
	}
}
