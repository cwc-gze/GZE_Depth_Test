package {



	import GZ.Gpu.ShaderModel.GzModel.GzShModel_Quad.GzShModel_Quad;

	
	public class DepthTestShader extends GzShModel_Quad {
		
		
			
		override public function fInsert_Body_Fragment():Void{	
			
			<glsl(oFragement)>
			
			   float _nDepth = 0.0;
			   
				///////////////// DEPTH TEST ////////////////
				vec2 vSrcPos =	ioTexture * vTexCurrent - 0.5;
				float _nPosX = iomWorldPt[0].x;
				//vec2 _vRelBush = vec2(_nPosX - 478.0, iomWorldPt[0].y);
				vec2 _vRelBush = vec2(_nPosX + vSrcPos.x  - 478.0, iomWorldPt[0].y + vSrcPos.y);
			

				if(vSrcPos.x > 478.0){  //Im a Rock
				
				
					vec4 pixDepthRock  = texture(TexSprites, ioTexture);
					//pixDepthRock.r *= 4.0 - 2.5; //Amplitude
					//pixDepthRock.r *= 2.0; //Amplitude
					pixDepthRock.r *= 3.0; //Amplitude
				//	pixDepthRock.r -= 0.5; //Amplitude
					pixDepthRock.r -= 1.0; //Amplitude
					//pixDepthRock.r *= 1.0  - 0.0; //Amplitude
				//	pixDepthRock.r *= 6.0 - 4.5; //Amplitude
				
				_nDepth = pixDepthRock.r / 8.5 ;
				
					
					//vec4 pixDepthBush  = texture(TexSprites, vec2(ioTexture.x  - iomWorldPt[0].x/(iomWorldPt[0].x - iomWorldPt[1].x),   ioTexture.y )    );
					vec4 pixDepthBush  = texture(TexSprites,  (_vRelBush + 0.5) / vTexCurrent );
					
					vec4 _pixBush = texture(TexCurrent,  (_vRelBush + 0.5) / vTexCurrent );
					//pixDepthBush.r *= _pixBush.a;
					//pixDepthRock.r *=  pixTex.a;
					
					
					//if(_pixBush.a > 0.0){ //Discard or not the lower level
						if(pixDepthRock.r < pixDepthBush.r){
							discard;
						}else{
							float _nDiff = vPtDist.a;
							vPtDist.a =   min((    (pixDepthRock.r - pixDepthBush.r) ) *6.0, pixTex.a) ;
							_nDiff = _nDiff - vPtDist.a;
							vPtDist.rgb -= _nDiff*4.0;
						}
					//}
					
					
				}else{ //Im a Bush
				
					vec4 pixDepthBush  = texture(TexSprites, ioTexture);
					//_nDepth = pixDepthBush.r / 5.0 ;
					_nDepth = pixDepthBush.r / 4.0 ;
					
					//vPtDist.rgb -=_nDepth * 3.0;
					vPtDist.rgb -= (1.0 - pixDepthBush.r)/5.0 ;
					
					/*
					vec4 pixDepthRock  = texture(TexSprites, ioTexture);
					pixDepthRock.r *= 4.0 - 2.5; //Amplitude
					
					//vec4 pixDepthBush  = texture(TexSprites, vec2(ioTexture.x  - iomWorldPt[0].x/(iomWorldPt[0].x - iomWorldPt[1].x),   ioTexture.y )    );
					vec4 pixDepthBush  = texture(TexSprites, ioTexture);
				
				
					float _nDiff = vPtDist.a;
					vPtDist.a =   min((    (pixDepthRock.r - pixDepthBush.r)   )*8.0, pixTex.a) ;
					_nDiff = _nDiff - vPtDist.a;
					vPtDist.rgb -= _nDiff*1.0;
					*/

					//vPtDist.rgb -= 0.5;
				}
				///////////////// 		///////////////// 		///////////////// 
				
			</glsl>
		}
	}
}