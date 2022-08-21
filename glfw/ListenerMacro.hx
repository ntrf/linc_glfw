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

@:allow(glfw)
class ListenerMacro
{
	macro static function callHaxe(name : String, args : Array<haxe.macro.Expr>)
	{
		var fnName = "on" + name;
		return macro {
			var l = Listener.get(w);
			if (l == null || l.$fnName == null) return;
			l.$fnName($a{args});
		}
	}

	macro static function assign(name : String)
	{
		var fnName = "on" + name;
		var setName = "_i_setCb" + name;
		var cppName = "cpp" + name;
		return macro {
			var l = Listener.get(this);
			if (l == null) throw "Listener is null!";
			l.$fnName = fn;
			glfw.Window.$setName(this, if (fn != null) cpp.Callable.fromStaticFunction(Listener.$cppName) else null);
		}
	}
}
