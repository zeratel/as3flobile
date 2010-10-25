/**
 * <p>Original Author: toddanderson</p>
 * <p>Class File: PendingInitializationCommand.as</p>
 * <p>Version: 0.3</p>
 *
 * <p>Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:</p>
 *
 * <p>The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.</p>
 *
 * <p>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.</p>
 *
 * <p>Licensed under The MIT License</p>
 * <p>Redistributions of files must retain the above copyright notice.</p>
 */
package com.custardbelly.as3flobile.model
{
	import flash.geom.Point;

	/**
	 * PendingInitializationCommand is a simple command model for invoking a target function with specified arguments.
	 * Usually created and queued by a client that needs to run some property updates after it has completed a specific phase in its initialization. 
	 * @author toddanderson
	 */
	public class PendingInitializationCommand implements IPendingInitializationCommand
	{
		public var targetFunction:Function;
		public var targetArguments:*;
		
		/**
		 * Constructor. 
		 * @param targetFunction Function The target function to invoke on execute.
		 * @param args ... The target arguments to apply to the function on execute.
		 */
		public function PendingInitializationCommand( targetFunction:Function, ...args ):void
		{
			this.targetFunction = targetFunction;
			this.targetArguments = [];
			
			for each( var obj:Object in args )
			{
				targetArguments.push( obj );
			}
		}
		
		/**
		 * @copy IPendingInitializationCommand#execute()
		 */
		public function execute():void
		{
			targetFunction.apply( this, targetArguments );
		}
	}
}