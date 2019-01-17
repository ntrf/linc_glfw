package glfw;

@:allow(glfw)
class ListenerMacro
{
	macro static function callHaxe(name : String, args : Array<haxe.macro.Expr>)
	{
		var fnName = "on" + name;
		return macro {
			var l = listeners.get(w);
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
