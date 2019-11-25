package  {

	import GZ.Gfx.Object;

	import GZ.File.RcImg;
	import GZ.Gfx.Root;

	import GZ.Sys.Interface.Interface;
	import GZ.Gfx.Clip;

	import GZ.Base.Math.Math;
	import GZ.Gfx.Clip.Img;
	
	import Demo.TestResult;
	import GZ.Sys.Interface.Context;
	import GZ.Gpu.ShaderModel.AtModel.Attribute_Quad;
	import GZ.File.RcAtlas;
	
	/**
	 * @author Maeiky
	 */
	public class DemoDepth extends Clip {

		
		
		public static var nInterger : Int;
		public  var nTime : Int = 0;
		
		public static var nFloat : Float;
		//public static var sTest : String = "Hello";

		
		public var oImg : Img;
		public var oRock : Img;
		
		public var oAtlas : RcAtlas;
		public var oDepthAtlas : RcAtlas;
		public var oAtlasImg : Img;
		
		public var oRcBush : RcImg;
		public var oRcRock : RcImg;
	
		
		public function DemoDepth( _oParent : Root ):Void {
			Clip(_oParent, 0.0, 0.0);
			
			oAtlas = new RcAtlas(1024);
			oDepthAtlas = new RcAtlas(1024);
			
			
			
			oRcBush = new  RcImg("Exe|Rc/Bush.png");
			oRcRock = new  RcImg("Exe|Rc/Rock.png");
			var _oDepthRcBush : RcImg = new  RcImg("Exe|Rc/BushDepth.png");
			var _oDepthRcRock : RcImg = new  RcImg("Exe|Rc/RockDepth.png");
			
			////////////////////////////////////////////////////
			oRcBush.fCpuLoad();
			oRcRock.fCpuLoad();
			_oDepthRcBush.fCpuLoad();
			_oDepthRcRock.fCpuLoad();
			
			
			if(Context.oItf.bGpuDraw){

				_oDepthRcBush.fSetGpuTexLayer(Attribute_Quad.oTexture);
				_oDepthRcBush.fGpuLoad();
			}
			oAtlasImg  = new Img(this, 0, 0,  _oDepthRcBush, false);
			
			
			
			
			
			//return;
			////////////////////////////////////////////////////	////////////////////////////////////////////////////
			
					
			
		//	oAtlas = new RcAtlas(1024);
			oAtlas.fAdd(oRcBush);
			oAtlas.fAdd(oRcRock);
			oAtlas.fPack();
			if(Context.oItf.bGpuDraw){
				oAtlas.fSetGpuTexLayer(Attribute_Quad.oTexture);
			}
			oAtlas.fTransposeAll();	
			oAtlas.fGpuLoad();
			

			//var _oDepthRcBush : RcImg = new  RcImg("Exe|Rc/Bush.png");
		
			//var _oDepthRcRock : RcImg = new  RcImg("Exe|Rc/Rock.png");

		//	oDepthAtlas = new RcAtlas(1024);
			oDepthAtlas.fAdd(_oDepthRcBush);
			oDepthAtlas.fAdd(_oDepthRcRock);
			oDepthAtlas.fPack();
			if(Context.oItf.bGpuDraw){
				oDepthAtlas.fSetGpuTexLayer(Attribute_Quad.oTexSprites);
			}
			oDepthAtlas.fTransposeAll();	
			oDepthAtlas.fGpuLoad();
			
			
			oAtlasImg  = new Img(this, 0, 0,  oDepthAtlas, false);
			
			oImg = new Img(this, 0.0, 0.0, oRcBush, false);
			oRock = new Img(this, 800.0, 600.0, oRcRock, true);

		}

		override public function fUpdateParentToChild():Void {
	
			var _nMouseX : Float = Context.nMouseX ;
			var _nMouseY : Float = Context.nMouseY ;

			//oImg.vRot.nPitch = oImg.vRot.nPitch + 0.005;
			//oImg.vRot.nRoll = oImg.vRot.nRoll + 0.008;
			oRock.vPos.nX = _nMouseX;
			oRock.vPos.nY = _nMouseY;
			
		}

		
		
		
		override public function fUpdateChildToParent():Void {
			//!Updated each frame, childs before
		}


	}
}
