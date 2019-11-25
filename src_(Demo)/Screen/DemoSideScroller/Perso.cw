package  {

	//import GZ.Sys.Window;
	//import GZ.GFX.Attribute;
	import GZ.Gfx.MovieClip;
	import GZ.Gfx.Root;
	import GZ.Input.Key;
	
	import GZ.File.RcImg;
	
	import GZ.File.RcAtlas;
	
	/**
	 * @author Maeiky
	 */

	public class Perso extends MovieClip {

		use Key.eKey;

		public var nSpeed : Float = 3;

		public function Perso( _oParent : Root, _nX: Float, _nY:Float):Void {
			MovieClip(_oParent, _nX , _nY);
		}



		override public function fUpdateParentToChild():Void {
		
		//	vPos.fSetSpeed(10);
		//	vPos.fSetLimit(99900);
		
	//	vPos.nX = vPos.nX + nSpeed;

			if(Key.fIsDown(Right)){ 
				vPos.nX = vPos.nX + nSpeed;
			//	MnX(nSpeed);
			//	TnWidth(1);
			}
			
			if(Key.fIsDown(Left)){ 
				vPos.nX = vPos.nX - nSpeed;
				//MnX(nSpeed * -1);
			//	TnWidth(-1);
			}


			fUpdateSequence();
			
			
		}





	}
}
