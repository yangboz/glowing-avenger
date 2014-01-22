
package
{
	//--------------------------------------------------------------------------
	//
	// Imports
	//
	//--------------------------------------------------------------------------
	
	/**
	 * AS3Ref.as class. Use AS3Ref for bind to object param 
	 * @author yangboz
	 * @langVersion 3.0
	 * @playerVersion 11.2+
	 * @airVersion 3.2+
	 * Created Jan 22, 2014 6:05:49 PM
	 * @history 12/30/13,
	 * @example: 
	 * var as3Ref:AS3Ref = new AS3Ref(movieclip , "currentFrame");
     * as3Ref.value = 10;//movieclip.currentFrame == 10;
	 */ 
	public class AS3Ref
	{ 
		////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		// <-------------------------- PARAMS
		
		// target object
		public var target:*;
		// value name or dictionary key
		public var key:*;
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		// <-------------------------- INIT
		
		/**
		 * init variable bridge
		 * @param        target                        setup target object
		 * @param        key                                param key (string with instance name for normal object or instance for Dictionary);
		 */
		public function AS3Ref(target:* = null , key:* = null){
			this.target = target;
			this.key = key;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		// <------------------------- FUNCTIONS
		
		/**
		 * set target param
		 */
		public function set value (param:*):void {
			if(target && key){
				target[key] = param;
			}else{
				target = param;
			}
		}
		
		/**
		 * return target param
		 */
		public function get value():* {
			return key != null ? target[key] : target;
		};
		
		
		/**
		 * try to set target param
		 */
		public function set softValue(param:*):void {
			try {
				if(target != null || key != null ){
					target[key] = param;
				}else{
					target = param;
				}
			}catch (e:Error){};
		}
		
		
		/**
		 * try to return target value
		 */
		public function get softValue():* {
			try {
				return key ? target[key] : target;
			}catch (e:Error){};
			return null;
		}
		
		
		/**
		 * 
		 * @return                LVar value
		 */
		public function valueOf():* {
			return value;
		}
		
		
		/**
		 * informations
		 * @return        serialized string
		 */
		public function toString():String {
			return "[DataProxy.AS3Ref:"+ target + " , "+ key +"]";
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		// <-------------------------- REMOVE
		
		public function remove():void {
			target = null;
			key = null;
		};
	}
	
}