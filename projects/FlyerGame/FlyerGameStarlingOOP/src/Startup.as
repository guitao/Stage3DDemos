/**
 * Copyright (C) 2005-2012 by Rivello Multimedia Consulting (RMC).                    
 * code [at] RivelloMultimediaConsulting [dot] com                                                  
 *                                                                      
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the      
 * "Software"), to deal in the Software without restriction, including  
 * without limitation the rights to use, copy, modify, merge, publish,  
 * distribute, sublicense, and#or sell copies of the Software, and to   
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:                                            
 *                                                                      
 * The above copyright notice and this permission notice shall be       
 * included in all copies or substantial portions of the Software.      
 *                                                                      
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,      
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF   
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR    
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.                                      
 */
//Marks the right margin of code *******************************************************************
package 
{
	// --------------------------------------
	// Imports
	// --------------------------------------
	import com.rmc.projects.flyergamestarlingoop.Game;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.filters.DropShadowFilter;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;
    
	// --------------------------------------
	// Class
	// --------------------------------------
	/**
	 * <p>The <code>ClassTemplate</code> class.</p>
	 * 
	 */
    [SWF(width="800", height="600", frameRate="30", backgroundColor="#f7f7f7")]
    public class Startup extends Sprite
    {
		// --------------------------------------
		// Properties
		// --------------------------------------
		// PUBLIC GETTER/SETTERS
		
		// PUBLIC CONST
		
		// PRIVATE
        private var _starling:Starling;
		
		// --------------------------------------
		// Constructor
		// --------------------------------------
		/**
		 * This is the constructor.
		 * 
		 */
        public function Startup()
        {
			// SUPER
			super();
			
			// EVENTS
			
			// VARIABLES
			
			// PROPERTIES
			
			// METHODS
			_init();
			
		}
		
		/**
		 * Initialize
		 * 
		 */		
		private function _init () : void
		{
			
			// Align the Flash Stage 
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align 	= StageAlign.TOP_LEFT;
			
			// Setup The 'Engine'
			_starling = new Starling (Game, stage);
			_starling.enableErrorChecking = true;
			_starling.start();
			
			//1 TO 16, LARGER = PRETTIER/SLOWER
			_starling.antiAliasing = 1;
			
			// Add Small Box of Framerate Statistics
			var stats : Stats =  new Stats();
			stats.filters = [new DropShadowFilter()]
			addChild( stats );
			

        }
    }
}