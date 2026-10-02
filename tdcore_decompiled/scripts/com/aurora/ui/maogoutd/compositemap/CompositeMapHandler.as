package com.aurora.ui.maogoutd.compositemap
{
   import a_4714.AssetType;
   import a_4714.AssetsItemData;
   import a_4714.AssetsLoader;
   import a_4718.b_182;
   import a_4789.a_4657;
   import com.adobe.utils.RandomSeed;
   import com.aurora.ui.maogoutd.compositemap.data.ComAirRes;
   import com.aurora.ui.maogoutd.compositemap.data.ComMapData;
   import com.aurora.ui.maogoutd.compositemap.data.ComMapRes;
   import com.aurora.ui.maogoutd.compositemap.data.FieldGridData;
   import com.aurora.ui.maogoutd.diy.xml.DIYConfigData;
   import com.aurora.ui.maogoutd.game.BattleLayerDefine;
   import com.aurora.ui.maogoutd.game.Util.BattleRandomUtil;
   import com.aurora.ui.maogoutd.game.a_3491;
   import com.aurora.ui.maogoutd.resource.Intruder.SnakeYear.CrossServerMouse.ShadowMouse.ShadowMouseMoveIntruder;
   import com.aurora.ui.maogoutd.resource.effect.FansEffect;
   import com.aurora.ui.maogoutd.resource.effect.VolcanicFireEffect;
   import com.aurora.ui.maogoutd.resource.gamemap.newMap.SnakeYear.DesertCross.TornadoShot;
   import com.aurora.ui.maogoutd.resource.shot.a_4348;
   import com.u321.go.xutils.ObjectPool;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class CompositeMapHandler
   {
      
      private static var m_pInstance:CompositeMapHandler;
      
      private static var ms_arrVolcanicFireEffects:Array;
      
      private static var ms_arrSkyAirShipFansEffect:Array;
      
      private static const DEEP_INDEX:int = 1;
      
      private static const PATH:String = "images/map/composite/";
      
      private static const SOUND_PATH:String = "resource/sound/backgound/";
      
      protected var m_stRandomSeed:RandomSeed = new RandomSeed();
      
      private var m_iCurrentTimeIntval:uint;
      
      private var m_iChangeCount:int;
      
      private var m_stCompositeMap:CompositeMap;
      
      private var m_stComMapData:ComMapData;
      
      private var m_vAir:Vector.<Boolean>;
      
      private var m_dictLoadComposite:Dictionary;
      
      private var m_arrAirBitmaps:Array;
      
      private var m_stAirSp:Sprite;
      
      private const NightAirSublayer:String = "grid/night_air_sublayer.png";
      
      private const NightAirUpper:String = "grid/night_air_upper.png";
      
      private const DayAirSublayer:String = "grid/day_air_sublayer.png";
      
      private const DayAirUpper:String = "grid/day_air_upper.png";
      
      private const FIELD_GRID_WIDTH:int = 60;
      
      private const FIELD_GRID_HEIGHT:int = 64;
      
      private const BATTLE_FIELD_GRID_NUM_X:int = 9;
      
      private const BATTLE_FIELD_GRID_NUM_Y:int = 7;
      
      private var m_stNightAirSublayer:ComAirRes;
      
      private var m_stNightAirUpper:ComAirRes;
      
      private var m_stDayAirSublayer:ComAirRes;
      
      private var m_stDayAirUpper:ComAirRes;
      
      private var m_stMapFans:Function;
      
      private var m_bIsMagmaMap:Boolean;
      
      private var m_bIsFansMap:Boolean;
      
      private var m_bIsSnowMap:Boolean;
      
      private var m_dictMagma:Dictionary;
      
      private var m_dictFan:Dictionary;
      
      private var m_iMapID:int = -1;
      
      public var group:Array = [];
      
      public var groupCreateTick:int = 0;
      
      public var groupMAX:int = 0;
      
      private var m_stCurrentBattleFieldView:Object;
      
      private var m_vObstacleImage:Vector.<Bitmap> = new Vector.<Bitmap>();
      
      private var a_1099:BitmapData = new BitmapData(1,1,true,0);
      
      private var m_tempBitmapData:BitmapData = new BitmapData(1,1);
      
      private var m_arrTempFieldGrid:Array = [];
      
      public function CompositeMapHandler()
      {
         var stComAirRes:ComAirRes = null;
         var iYIndex:int = 0;
         super();
         this.m_vAir = new Vector.<Boolean>(7);
         this.m_stCompositeMap = new CompositeMap();
         this.m_dictLoadComposite = new Dictionary();
         this.m_arrAirBitmaps = new Array();
         this.m_stAirSp = new Sprite();
         this.m_stNightAirSublayer = new ComAirRes();
         this.m_stNightAirSublayer.m_strRes = this.NightAirSublayer;
         this.m_stNightAirUpper = new ComAirRes();
         this.m_stNightAirUpper.m_strRes = this.NightAirUpper;
         this.m_stDayAirSublayer = new ComAirRes();
         this.m_stDayAirSublayer.m_strRes = this.DayAirSublayer;
         this.m_stDayAirUpper = new ComAirRes();
         this.m_stDayAirUpper.m_strRes = this.DayAirUpper;
         for(iYIndex = 0; iYIndex < 7; iYIndex++)
         {
            this.m_arrAirBitmaps[iYIndex] = [];
         }
         if(null == ms_arrVolcanicFireEffects)
         {
            ms_arrVolcanicFireEffects = [];
            for(iYIndex = 0; iYIndex < this.BATTLE_FIELD_GRID_NUM_Y; iYIndex++)
            {
               ms_arrVolcanicFireEffects[iYIndex] = [];
            }
         }
         if(null == ms_arrSkyAirShipFansEffect)
         {
            ms_arrSkyAirShipFansEffect = [];
            for(iYIndex = 0; iYIndex < this.BATTLE_FIELD_GRID_NUM_Y; iYIndex++)
            {
               ms_arrSkyAirShipFansEffect[iYIndex] = [];
            }
         }
      }
      
      public static function Get() : CompositeMapHandler
      {
         if(null == m_pInstance)
         {
            m_pInstance = new CompositeMapHandler();
            a_4657.getInstance().addListener(m_pInstance);
         }
         return m_pInstance;
      }
      
      public function SetCrossMapID(value:int) : void
      {
         this.m_iMapID = value;
      }
      
      public function set BattleMapID(value:int) : void
      {
         this.m_iMapID = value;
      }
      
      public function get BattleMapID() : int
      {
         return this.m_iMapID;
      }
      
      public function IsCompositeMap() : Boolean
      {
         if(Boolean(CompositeMapXML.Get().GetMapData(this.m_iMapID)) && (this.m_iMapID & 0xFF000000) != 1358954496)
         {
            return true;
         }
         return false;
      }
      
      public function GetCompositeMap() : CompositeMap
      {
         return this.m_stCompositeMap;
      }
      
      public function GetCompositeMapSoundBGUrl() : String
      {
         if(this.m_stComMapData)
         {
            return SOUND_PATH + this.m_stComMapData.m_strSoundBGUrl;
         }
         return null;
      }
      
      public function GetCompositeMapBossSoundBGUrl() : String
      {
         if(this.m_stComMapData)
         {
            return SOUND_PATH + this.m_stComMapData.m_strBossSoundBGUrl;
         }
         return null;
      }
      
      public function GetCompositeMapShowBGUrl(iMapID:int) : String
      {
         return PATH + CompositeMapXML.Get().GetMapData(iMapID).m_strShowBGUrl;
      }
      
      public function GetCompositeMapShowInsideBGUrl() : String
      {
         return PATH + CompositeMapXML.Get().GetMapData(this.m_iMapID).m_strShowInsideBGUrl;
      }
      
      public function GetDropType() : int
      {
         if(this.m_stComMapData)
         {
            return this.m_stComMapData.m_iDropType;
         }
         return CompositeMapXML.Get().GetMapData(this.m_iMapID).m_iDropType;
      }
      
      public function GetDropType2(iMapID:int) : int
      {
         var comMapData:ComMapData = CompositeMapXML.Get().GetMapData(iMapID);
         if(comMapData != null)
         {
            return comMapData.m_iDropType;
         }
         return 8;
      }
      
      public function InitComposite(iScene:int = 0) : void
      {
         var gridData:FieldGridData = null;
         if((this.m_iMapID & 0xF0000000) == 1610612736)
         {
            this.m_stComMapData = DIYConfigData.Get().GetBattleMapData(DIYConfigData.Get().GetMapIndex(iScene),this.m_iMapID);
         }
         else
         {
            this.m_stComMapData = CompositeMapXML.Get().GetMapData(this.m_iMapID);
         }
         this.m_bIsMagmaMap = false;
         this.m_bIsSnowMap = false;
         if(null == this.m_stComMapData)
         {
            return;
         }
         this.m_bIsSnowMap = this.m_stComMapData.m_FrozenCDTime > 0 && this.m_stComMapData.m_FrozenTime > 0 ? true : false;
         this.m_dictMagma = new Dictionary();
         this.m_dictFan = new Dictionary();
         this.m_arrTempFieldGrid.length = 0;
         this.m_stCompositeMap.a_4176().m_iBattleFieldStageType = this.m_stComMapData.m_iStageType;
         this.m_stCompositeMap.a_4176().m_iBattleModType = this.m_stComMapData.m_iBattleModeType;
         this.m_stCompositeMap.a_4176().m_iWeatherType = this.m_stComMapData.m_iWeatherType;
         var dict:Dictionary = new Dictionary();
         this.SetURL(dict,this.m_stComMapData.m_strBGUrl);
         this.SetURL(dict,this.m_stComMapData.m_strInsideBGUrl);
         this.SetURL(dict,this.NightAirSublayer);
         this.SetURL(dict,this.NightAirUpper);
         this.SetURL(dict,this.DayAirSublayer);
         this.SetURL(dict,this.DayAirUpper);
         this.groupCreateTick = 0;
         this.group = [null,null,null,null,null,null,null,null,null,null];
         var i:int = 0;
         var len:int = int(this.m_stComMapData.m_vGridData.length);
         while(i < len)
         {
            gridData = this.m_stComMapData.m_vGridData[i];
            this.SetURL(dict,gridData.m_strResUrl);
            if(this.m_stComMapData.tornado_num > 0 && gridData.tornado_group >= 0)
            {
               if(this.group[gridData.tornado_group] == null)
               {
                  this.group[gridData.tornado_group] = new Array();
               }
               this.group[gridData.tornado_group].push(gridData);
            }
            i++;
         }
         this.groupMAX = 0;
         for(var j:int = 0; j < this.group.length; j++)
         {
            if(this.group[j] == null)
            {
               this.groupMAX = j;
               break;
            }
         }
         var stLoader:AssetsLoader = new AssetsLoader();
         stLoader.load(dict,{"onComplete":this.onLoaderMapImageEvent});
      }
      
      private function SetURL(dict:Dictionary, url:String) : void
      {
         if(this.m_dictLoadComposite[url])
         {
            return;
         }
         if(null == url || "" == url)
         {
            return;
         }
         if((this.m_iMapID & 0xF0000000) == 1610612736 && url != this.NightAirSublayer && url != this.NightAirUpper && url != this.DayAirSublayer && url != this.DayAirUpper)
         {
            dict[url] = new AssetsItemData(url,AssetType.JPG,url);
         }
         else
         {
            dict[url] = new AssetsItemData(PATH + url,AssetType.JPG,url);
         }
         var stRes:ComMapRes = ObjectPool.CheckOut(ComMapRes) as ComMapRes;
         stRes.m_strURL = url;
         this.m_dictLoadComposite[url] = stRes;
      }
      
      private function onLoaderMapImageEvent(dict:Dictionary) : void
      {
         var stRes:ComMapRes = null;
         var image:Bitmap = null;
         var stBGMapRes:ComMapRes = null;
         var stInsideBGMapRes:ComMapRes = null;
         var stComAirRes:ComAirRes = null;
         var iYIndex:int = 0;
         var iXIndex:int = 0;
         var stBattleFieldFor4View:Object = null;
         for each(stRes in this.m_dictLoadComposite)
         {
            if(dict[stRes.m_strURL] != null && Boolean(dict[stRes.m_strURL].data))
            {
               image = dict[stRes.m_strURL].data;
               stRes.m_pBitmapData = image.bitmapData;
               stBGMapRes = this.m_dictLoadComposite[this.m_stComMapData.m_strBGUrl] as ComMapRes;
               stInsideBGMapRes = this.m_dictLoadComposite[this.m_stComMapData.m_strInsideBGUrl] as ComMapRes;
               if(this.NightAirSublayer == stRes.m_strURL || this.NightAirUpper == stRes.m_strURL || this.DayAirSublayer == stRes.m_strURL || this.DayAirUpper == stRes.m_strURL)
               {
                  for(iYIndex = 0; iYIndex < 7; iYIndex++)
                  {
                     for(iXIndex = 0; iXIndex < 9; iXIndex++)
                     {
                        stComAirRes = this.m_arrAirBitmaps[iYIndex][iXIndex];
                        if(Boolean(stComAirRes) && stComAirRes.m_strRes == stRes.m_strURL)
                        {
                           stComAirRes.bitmapData = image.bitmapData;
                        }
                     }
                  }
                  if(this.NightAirSublayer == stRes.m_strURL)
                  {
                     this.m_stNightAirSublayer.bitmapData = image.bitmapData;
                  }
                  else if(this.NightAirUpper == stRes.m_strURL)
                  {
                     this.m_stNightAirUpper.bitmapData = image.bitmapData;
                  }
                  else if(this.DayAirSublayer == stRes.m_strURL)
                  {
                     this.m_stDayAirSublayer.bitmapData = image.bitmapData;
                  }
                  else if(this.DayAirUpper == stRes.m_strURL)
                  {
                     this.m_stDayAirUpper.bitmapData = image.bitmapData;
                  }
               }
               if(Boolean(stBGMapRes && stBGMapRes.m_pBitmapData && stInsideBGMapRes) && Boolean(stInsideBGMapRes.m_pBitmapData) && Boolean(this.m_stCurrentBattleFieldView))
               {
                  stBattleFieldFor4View = this.m_stCurrentBattleFieldView.parent;
                  stBattleFieldFor4View.m_stBackgroudBitmapData = stBGMapRes.m_pBitmapData;
                  stBattleFieldFor4View.m_stBackgroudBitmap.bitmapData = stBattleFieldFor4View.m_stBackgroudBitmapData;
                  stBattleFieldFor4View.m_stBackgroudBitmapData.copyPixels(stInsideBGMapRes.m_pBitmapData,stInsideBGMapRes.m_pBitmapData.rect,new Point(293,100));
               }
            }
         }
      }
      
      public function SetBattleFieldView(stCurrentBattleFieldView:Object) : void
      {
         stCurrentBattleFieldView.stMoveSprite.addChildAt(this.m_stAirSp,0);
         this.m_stCurrentBattleFieldView = stCurrentBattleFieldView;
         if(this.m_bIsSnowMap)
         {
            SnowMapManager.getInstance().SetBattleFieldView(stCurrentBattleFieldView);
            SnowMapManager.getInstance().m_FrozenTime = this.m_stComMapData.m_FrozenTime;
            SnowMapManager.getInstance().m_FrozenCDTime = this.m_stComMapData.m_FrozenCDTime;
         }
         if(this.m_stComMapData.sandstorm_restore > 0)
         {
            this.m_stCurrentBattleFieldView.getDesertFogSprite().InitData(1,this.m_stComMapData.sandstormCD_time);
            this.m_stCurrentBattleFieldView.getDesertFogSprite().initFog(this.m_stComMapData.sandstorm_initial_col,this.m_stComMapData.sandstorm_restore,this.m_stComMapData.sandstorm_time);
         }
      }
      
      public function SetBattleFieldTerrain(stCurrentBattleFieldView:Object) : void
      {
         var grid:FieldGridData = null;
         var j:int = 0;
         var i:int = 0;
         var len:int = 0;
         var air:ComAirRes = null;
         if(!stCurrentBattleFieldView.isOwnBattleField)
         {
            return;
         }
         while(this.m_stAirSp.numChildren > 0)
         {
            air = this.m_stAirSp.removeChildAt(0) as ComAirRes;
            ObjectPool.CheckIn(air);
         }
         for(i = 0; i < 7; i++)
         {
            this.m_vAir[i] = false;
            for(j = 0; j < 9; j++)
            {
               this.m_arrAirBitmaps[i][j] = null;
               this.SetFieldGridData(stCurrentBattleFieldView.stFieldGridsVector[i][j],0,j,i);
            }
         }
         i = 0;
         len = int(this.m_stComMapData.m_vGridData.length);
         while(i < len)
         {
            grid = this.m_stComMapData.m_vGridData[i];
            if(-1 == grid.x)
            {
               for(j = 0; j < 9; j++)
               {
                  this.SetFieldGridData(stCurrentBattleFieldView.stFieldGridsVector[grid.y][j],grid.m_iGridType,j,grid.y);
                  this.AddObstacleImage(grid.m_strResUrl,j,grid.y);
               }
            }
            else if(-1 == grid.y)
            {
               for(j = 0; j < 7; j++)
               {
                  this.SetFieldGridData(stCurrentBattleFieldView.stFieldGridsVector[j][grid.x],grid.m_iGridType,grid.x,j);
                  this.AddObstacleImage(grid.m_strResUrl,grid.x,j);
               }
            }
            else
            {
               this.SetFieldGridData(stCurrentBattleFieldView.stFieldGridsVector[grid.y][grid.x],grid.m_iGridType,grid.x,grid.y);
               this.AddObstacleImage(grid.m_strResUrl,grid.x,grid.y);
            }
            i++;
         }
         this.m_stRandomSeed.setSeed(100,500);
      }
      
      private function SetFieldGridData(stFieldGrid:*, iGridType:int, iXIndex:int, iYIndex:int) : void
      {
         var flag:String = null;
         var stComAirRes:ComAirRes = null;
         switch(iGridType)
         {
            case 1:
               stFieldGrid.m_iFieldGridType = 0;
               stFieldGrid.m_isNeedTray = true;
               break;
            case 2:
               stFieldGrid.m_iFieldGridType = 3;
               stFieldGrid.m_isNeedTray = false;
               break;
            case 3:
               stFieldGrid.m_iFieldGridType = 0;
               stFieldGrid.m_isNeedTray = false;
               stFieldGrid.a_3502();
               break;
            case 4:
               stFieldGrid.m_iFieldGridType = 0;
               stFieldGrid.m_isNeedTray = false;
               this.m_vAir[iYIndex] = true;
               if(null == this.m_arrAirBitmaps[iYIndex][iXIndex])
               {
                  if(iXIndex % 2 == 0)
                  {
                     if(this.m_stComMapData.m_iStageType == 0)
                     {
                        stComAirRes = this.m_stNightAirSublayer.a_4451();
                        this.m_stAirSp.addChild(stComAirRes);
                     }
                     else
                     {
                        stComAirRes = this.m_stDayAirSublayer.a_4451();
                        this.m_stAirSp.addChild(stComAirRes);
                     }
                  }
                  else if(this.m_stComMapData.m_iStageType == 0)
                  {
                     stComAirRes = this.m_stNightAirUpper.a_4451();
                     this.m_stAirSp.addChildAt(stComAirRes,0);
                  }
                  else
                  {
                     stComAirRes = this.m_stDayAirUpper.a_4451();
                     this.m_stAirSp.addChildAt(stComAirRes,0);
                  }
                  stComAirRes.x = this.FIELD_GRID_WIDTH * iXIndex;
                  stComAirRes.y = this.FIELD_GRID_HEIGHT * iYIndex;
                  this.m_arrAirBitmaps[iYIndex][iXIndex] = stComAirRes;
               }
               break;
            case 5:
               this.m_bIsMagmaMap = true;
               flag = iXIndex + "_" + iYIndex;
               this.m_dictMagma[flag] = stFieldGrid;
               break;
            case 6:
               stFieldGrid.a_3502();
               this.m_bIsFansMap = true;
               stFieldGrid.m_iFieldGridType = 3;
               stFieldGrid.m_isNeedTray = false;
               flag = iXIndex + "_" + iYIndex;
               this.m_dictFan[flag] = stFieldGrid;
               this.AddFanEffect(stFieldGrid);
               break;
            case 7:
               stFieldGrid.m_iFieldGridType = 0;
               stFieldGrid.m_isNeedTray = false;
               stFieldGrid.a_3502();
               this.CreateShadowMouse(iXIndex,iYIndex);
               break;
            default:
               stFieldGrid.m_iFieldGridType = 0;
               stFieldGrid.m_isNeedTray = false;
               stFieldGrid.a_3502();
         }
      }
      
      private function CreateShadowMouse(iNoX:int, iNoY:int) : void
      {
         var grid1:a_3491 = null;
         var shadowMouse:ShadowMouseMoveIntruder = null;
         grid1 = this.m_stCurrentBattleFieldView.a_3438(iNoX,iNoY);
         if(grid1 == null)
         {
            return;
         }
         shadowMouse = ShadowMouseMoveIntruder.a_3926() as ShadowMouseMoveIntruder;
         shadowMouse.a_1797((1 << 16) + iNoY + 91,-1);
         shadowMouse.m_stMoveIntruderTypeID = 8393228;
         shadowMouse.x = a_3491.a_1080 * (grid1.m_iXGridNo + 0.5);
         this.m_stCurrentBattleFieldView.a_3459(shadowMouse,grid1);
         this.m_stCurrentBattleFieldView.AddToBattleView(shadowMouse,BattleLayerDefine.INTRUDER_LAND_TYPE,grid1);
      }
      
      private function AddObstacleImage(url:*, x:*, y:*) : void
      {
         var bmp:Bitmap = null;
         if(Boolean(url != "") && Boolean(this.m_dictLoadComposite[url]) && Boolean(ComMapRes(this.m_dictLoadComposite[url]).m_pBitmapData))
         {
            bmp = ObjectPool.CheckOut(Bitmap) as Bitmap;
            bmp.bitmapData = ComMapRes(this.m_dictLoadComposite[url]).m_pBitmapData;
            bmp.x = this.FIELD_GRID_WIDTH * x + 30 - bmp.width / 2;
            bmp.y = this.FIELD_GRID_HEIGHT * y + 32 - bmp.height / 2;
            this.m_vObstacleImage.push(bmp);
            this.m_stCurrentBattleFieldView.stMoveSprite.addChild(bmp);
         }
      }
      
      public function a_4172() : BitmapData
      {
         var url:String = this.m_stComMapData.m_strBGUrl;
         var stComMapRes:ComMapRes = ComMapRes(this.m_dictLoadComposite[this.m_stComMapData.m_strBGUrl]);
         if(stComMapRes)
         {
            if(stComMapRes.m_pBitmapData)
            {
               return stComMapRes.m_pBitmapData;
            }
            return this.a_1099;
         }
         throw new Error("ComMapRes Error");
      }
      
      public function a_4173() : BitmapData
      {
         var url:String = this.m_stComMapData.m_strInsideBGUrl;
         var stComMapRes:ComMapRes = ComMapRes(this.m_dictLoadComposite[url]);
         if(stComMapRes)
         {
            if(stComMapRes.m_pBitmapData)
            {
               return stComMapRes.m_pBitmapData;
            }
            return this.a_1099;
         }
         throw new Error("ComMapRes Error");
      }
      
      public function a_4174() : BitmapData
      {
         var url:String = this.m_stComMapData.m_strInsideBGUrl;
         var stComMapRes:ComMapRes = ComMapRes(this.m_dictLoadComposite[url]);
         if(stComMapRes)
         {
            if(stComMapRes.m_pBitmapData)
            {
               return stComMapRes.m_pBitmapData;
            }
            return this.a_1099;
         }
         throw new Error("ComMapRes Error");
      }
      
      public function OnTimeInterval(iTimeNum:uint) : void
      {
         if(this.m_stComMapData.m_iAirTime > 0)
         {
            this.OnTimeIntervalByAir(iTimeNum);
         }
         else if(this.m_bIsMagmaMap)
         {
            this.OnTimeIntervalByMagma(iTimeNum);
         }
         else if(this.m_bIsFansMap)
         {
            this.OnTimeIntervalByFans(iTimeNum);
         }
         if(this.m_bIsSnowMap)
         {
            SnowMapManager.getInstance().OnTimeInterval(iTimeNum);
         }
         this.OnTimeIntervalByDesert(iTimeNum);
      }
      
      private function OnTimeIntervalByFans(iTimeNum:uint) : void
      {
         var stSkyAirShipFansEffect:FansEffect = null;
         var iYIndex:int = 0;
         var arrBaseMoveIntruderVector:Array = null;
         var stMoveIntruder:* = undefined;
         var stTempFieldGrid:* = undefined;
         this.m_iCurrentTimeIntval = iTimeNum;
         if(ms_arrVolcanicFireEffects)
         {
            for(iYIndex = 0; iYIndex < this.BATTLE_FIELD_GRID_NUM_Y; iYIndex++)
            {
               for each(stSkyAirShipFansEffect in ms_arrSkyAirShipFansEffect[iYIndex])
               {
                  if(stSkyAirShipFansEffect)
                  {
                     stSkyAirShipFansEffect.a_4003(iTimeNum);
                  }
               }
            }
         }
         if(iTimeNum % 160 == 0)
         {
            arrBaseMoveIntruderVector = this.m_stCurrentBattleFieldView.m_arrBaseMoveIntruderVector;
            for each(stTempFieldGrid in this.m_dictFan)
            {
               for each(stMoveIntruder in stTempFieldGrid.a_1511.slice())
               {
                  if(stMoveIntruder.iLifeValue <= 1800 && stMoveIntruder.iSpaceState == 0)
                  {
                     stTempFieldGrid.a_3457(stMoveIntruder);
                     stTempFieldGrid.m_stCurrentBattbleFieldView.a_3457(stMoveIntruder);
                     if(-1 != arrBaseMoveIntruderVector.indexOf(stMoveIntruder))
                     {
                        arrBaseMoveIntruderVector.splice(arrBaseMoveIntruderVector.indexOf(stMoveIntruder),1);
                     }
                     this.m_stCurrentBattleFieldView.a_3459(stMoveIntruder,this.m_stCurrentBattleFieldView.a_3438(stTempFieldGrid.m_iXGridNo - 3,stTempFieldGrid.m_iYGridNo),false);
                     stMoveIntruder.x = 60 * (stTempFieldGrid.m_iXGridNo - 2.5);
                  }
               }
            }
         }
      }
      
      private function OnTimeIntervalByAir(iTimeNum:uint) : void
      {
         var stNewAirBitmap:ComAirRes = null;
         var iXIndex:int = 0;
         var stAirBitmap:ComAirRes = null;
         if(this.m_stComMapData.m_iAirTime <= 0)
         {
            return;
         }
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         var numAirMoveSpreed:Number = this.FIELD_GRID_WIDTH / 120;
         stNewAirBitmap = null;
         var iNoAirCloudRow:int = -1;
         var iFrameTime:int = this.m_stComMapData.m_iAirTime * 120;
         if(iTimeNum > 100 && iTimeNum % 120 == 1)
         {
            if(iTimeNum % iFrameTime == 1)
            {
               iNoAirCloudRow = int(this.m_stRandomSeed.nextInt(7));
            }
            else
            {
               iNoAirCloudRow = 2 * 7;
            }
         }
         for(var iYIndex:int = 0; iYIndex < 7; iYIndex++)
         {
            if(false != this.m_vAir[iYIndex])
            {
               for(iXIndex = 2; iXIndex < 9; iXIndex++)
               {
                  stAirBitmap = this.m_arrAirBitmaps[iYIndex][iXIndex];
                  if(stAirBitmap)
                  {
                     stAirBitmap.x -= numAirMoveSpreed;
                     if(iNoAirCloudRow >= 0 && stAirBitmap.x < 1.5 * this.FIELD_GRID_WIDTH && this.m_stAirSp.contains(stAirBitmap))
                     {
                        this.m_stAirSp.removeChild(stAirBitmap);
                     }
                  }
                  else if(Boolean(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex].m_stBaseToolDefense) || Boolean(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex - 1].m_stBaseToolDefense) || Boolean(iYIndex < 7 - 1) && (Boolean(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][iXIndex].m_stBaseToolDefense || this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex + 1][iXIndex - 1].m_stBaseToolDefense)))
                  {
                     stNewAirBitmap = null;
                     if(iYIndex != iNoAirCloudRow)
                     {
                        if(this.m_iChangeCount % 2 == 0)
                        {
                           if(this.m_stComMapData.m_iStageType == 0)
                           {
                              stNewAirBitmap = this.m_stNightAirUpper.a_4451();
                              stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex - this.FIELD_GRID_WIDTH * (iTimeNum % 120) / 120;
                              stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                              this.m_stAirSp.addChild(stNewAirBitmap);
                           }
                           else
                           {
                              stNewAirBitmap = this.m_stDayAirUpper.a_4451();
                              stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex - this.FIELD_GRID_WIDTH * (iTimeNum % 120) / 120;
                              stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                              this.m_stAirSp.addChild(stNewAirBitmap);
                           }
                        }
                        else if(this.m_stComMapData.m_iStageType == 0)
                        {
                           stNewAirBitmap = this.m_stNightAirSublayer.a_4451();
                           stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex - this.FIELD_GRID_WIDTH * (iTimeNum % 120) / 120;
                           stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                           this.m_stAirSp.addChildAt(stNewAirBitmap,DEEP_INDEX);
                        }
                        else
                        {
                           stNewAirBitmap = this.m_stDayAirSublayer.a_4451();
                           stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex - this.FIELD_GRID_WIDTH * (iTimeNum % 120) / 120;
                           stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                           this.m_stAirSp.addChildAt(stNewAirBitmap,DEEP_INDEX);
                        }
                     }
                     this.m_arrAirBitmaps[iYIndex][iXIndex] = stNewAirBitmap;
                  }
                  else if(iTimeNum % 120 > 0 && iTimeNum % 120 < 100)
                  {
                     this.a_3502(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex]);
                  }
                  if(iNoAirCloudRow >= 0)
                  {
                     isChanged = true;
                     if(iXIndex == 8)
                     {
                        stNewAirBitmap = null;
                        if(iYIndex != iNoAirCloudRow)
                        {
                           if(this.m_iChangeCount % 2 == 0)
                           {
                              if(this.m_stComMapData.m_iStageType == 0)
                              {
                                 stNewAirBitmap = this.m_stNightAirUpper.a_4451();
                                 stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex;
                                 stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                                 this.m_stAirSp.addChild(stNewAirBitmap);
                              }
                              else
                              {
                                 stNewAirBitmap = this.m_stDayAirUpper.a_4451();
                                 stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex;
                                 stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                                 this.m_stAirSp.addChild(stNewAirBitmap);
                              }
                           }
                           else if(this.m_stComMapData.m_iStageType == 0)
                           {
                              stNewAirBitmap = this.m_stNightAirSublayer.a_4451();
                              stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex;
                              stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                              this.m_stAirSp.addChildAt(stNewAirBitmap,DEEP_INDEX);
                           }
                           else
                           {
                              stNewAirBitmap = this.m_stDayAirSublayer.a_4451();
                              stNewAirBitmap.x = this.FIELD_GRID_WIDTH * iXIndex;
                              stNewAirBitmap.y = this.FIELD_GRID_HEIGHT * iYIndex;
                              this.m_stAirSp.addChildAt(stNewAirBitmap,DEEP_INDEX);
                           }
                        }
                        this.m_arrAirBitmaps[iYIndex][iXIndex] = stNewAirBitmap;
                     }
                     else
                     {
                        this.m_arrAirBitmaps[iYIndex][iXIndex] = this.m_arrAirBitmaps[iYIndex][iXIndex + 1];
                     }
                  }
               }
            }
         }
         if(isChanged)
         {
            ++this.m_iChangeCount;
         }
         for(iYIndex = 0; iYIndex < 7; iYIndex++)
         {
            for(iXIndex = 0; iXIndex < 9; iXIndex++)
            {
               if(this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex].m_stBaseToolDefense)
               {
                  this.m_stCurrentBattleFieldView.stFieldGridsVector[iYIndex][iXIndex].m_stBaseToolDefense.a_3940();
               }
            }
         }
      }
      
      private function OnTimeIntervalByMagma(iTimeNum:uint) : void
      {
         var stTempFieldGrid:* = undefined;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         var stBaseShot:* = undefined;
         var arrFireXRang:Array = null;
         var arrShot:Array = null;
         var iY:int = 0;
         var iYIndex:int = 0;
         this.m_iCurrentTimeIntval = iTimeNum;
         var isChanged:Boolean = false;
         if(iTimeNum % 20 == 0)
         {
            for each(stTempFieldGrid in this.m_dictMagma)
            {
               this.BurnFieldGridDefense(stTempFieldGrid);
            }
         }
         if(iTimeNum % 6)
         {
            for each(stTempFieldGrid in this.m_dictMagma)
            {
               this.BurnFieldGridMoveIntruder(stTempFieldGrid);
               this.AddVolcanicFireEffect(stTempFieldGrid);
            }
         }
         this.m_arrTempFieldGrid.length = 0;
         if(iTimeNum % 4 == 0)
         {
            for each(stTempFieldGrid in this.m_dictMagma)
            {
               if(null == this.m_arrTempFieldGrid[stTempFieldGrid.m_iYGridNo])
               {
                  this.m_arrTempFieldGrid[stTempFieldGrid.m_iYGridNo] = [];
               }
               if(!this.IsExistDefenseForGrid(this.m_stCurrentBattleFieldView.stFieldGridsVector[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo]))
               {
                  this.m_arrTempFieldGrid[stTempFieldGrid.m_iYGridNo].push([this.FIELD_GRID_WIDTH * stTempFieldGrid.m_iXGridNo,this.FIELD_GRID_WIDTH * (stTempFieldGrid.m_iXGridNo + 1)]);
               }
            }
            for(iY = 0; iY < this.BATTLE_FIELD_GRID_NUM_Y; iY++)
            {
               arrShot = this.m_stCurrentBattleFieldView.m_stBaseShotVector[iY];
               for each(stBaseShot in arrShot)
               {
                  if(!stBaseShot.isParabolaPath && !stBaseShot.m_isShotHighSkySpace && null != this.m_arrTempFieldGrid[iY] && this.IsShotInXRang(stBaseShot.x,this.m_arrTempFieldGrid[iY]))
                  {
                     stBaseShot.a_4350();
                  }
               }
            }
            if(ms_arrVolcanicFireEffects)
            {
               for(iYIndex = 0; iYIndex < this.BATTLE_FIELD_GRID_NUM_Y; iYIndex++)
               {
                  for each(stVolcanicFireEffect in ms_arrVolcanicFireEffects[iYIndex])
                  {
                     if(stVolcanicFireEffect)
                     {
                        stVolcanicFireEffect.a_4003(null);
                     }
                  }
               }
            }
         }
      }
      
      protected function AddVolcanicFireEffect(stTempFieldGrid:*) : Boolean
      {
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         if(this.IsExistDefenseForGrid(stTempFieldGrid) || stTempFieldGrid.a_1511.length > 0)
         {
            if(null == ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
            {
               stVolcanicFireEffect = VolcanicFireEffect.a_3926();
               stVolcanicFireEffect.a_1797(false);
               stVolcanicFireEffect.x = this.FIELD_GRID_WIDTH * stTempFieldGrid.m_iXGridNo;
               stVolcanicFireEffect.y = this.FIELD_GRID_HEIGHT * (stTempFieldGrid.m_iYGridNo + 0.7);
               this.m_stCurrentBattleFieldView.AddToBattleView(stVolcanicFireEffect,BattleLayerDefine.EFFECT_LAYER_TOP_TYPE,stTempFieldGrid);
               ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stVolcanicFireEffect;
            }
         }
         else if(ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stVolcanicFireEffect = ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo];
            stVolcanicFireEffect.a_3940();
            ms_arrVolcanicFireEffects[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = null;
         }
         return true;
      }
      
      protected function AddFanEffect(stTempFieldGrid:*) : Boolean
      {
         var stSkyAirShipFansEffect:FansEffect = null;
         if(null == ms_arrSkyAirShipFansEffect[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo])
         {
            stSkyAirShipFansEffect = FansEffect.a_3926();
            stSkyAirShipFansEffect.a_1797(false);
            stSkyAirShipFansEffect.x = this.FIELD_GRID_WIDTH * (stTempFieldGrid.m_iXGridNo - 0.3);
            stSkyAirShipFansEffect.y = this.FIELD_GRID_HEIGHT * (stTempFieldGrid.m_iYGridNo - 0.2);
            this.m_stCurrentBattleFieldView.AddToBattleView(stSkyAirShipFansEffect,BattleLayerDefine.EFFECTS_BASE_TYPE,stTempFieldGrid);
            ms_arrSkyAirShipFansEffect[stTempFieldGrid.m_iYGridNo][stTempFieldGrid.m_iXGridNo] = stSkyAirShipFansEffect;
         }
         return true;
      }
      
      protected function IsShotInXRang(numXShotPos:Number, arrXRang:Array) : Boolean
      {
         var arrXTempRang:Array = null;
         for each(arrXTempRang in arrXRang)
         {
            if(numXShotPos > arrXTempRang[0] && numXShotPos < arrXTempRang[1])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function IsExistDefenseForGrid(stFieldGrid:*) : Boolean
      {
         if(Boolean(stFieldGrid.m_stBaseToolDefense) || Boolean(stFieldGrid.a_3492()))
         {
            return true;
         }
         return false;
      }
      
      protected function BurnFieldGridDefense(stFieldGrid:*) : Boolean
      {
         if(null != stFieldGrid.m_stBaseToolDefense)
         {
            stFieldGrid.m_stBaseToolDefense.m_iDieType = 1;
            stFieldGrid.m_stBaseToolDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(10);
         }
         else if(null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.a_3512() != 15728641)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(10);
         }
         else if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(10);
         }
         else if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(10);
         }
         else if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(10);
         }
         return true;
      }
      
      protected function BurnFieldGridMoveIntruder(stFieldGrid:*) : Boolean
      {
         var stBaseMoveIntruder:* = undefined;
         for each(stBaseMoveIntruder in stFieldGrid.a_1511)
         {
            stBaseMoveIntruder.a_4208(b_182.a_436,6);
         }
         return true;
      }
      
      protected function a_3502(stFieldGrid:*) : Boolean
      {
         if(null != stFieldGrid.m_stProtector)
         {
            stFieldGrid.m_stProtector.m_iDieType = 1;
            stFieldGrid.m_stProtector.a_3969(stFieldGrid.m_stProtector.iLifeValue);
         }
         if(null != stFieldGrid.m_stAttackFighter && stFieldGrid.m_stAttackFighter.a_3512() != 15728641)
         {
            stFieldGrid.m_stAttackFighter.m_iDieType = 1;
            stFieldGrid.m_stAttackFighter.a_3969(stFieldGrid.m_stAttackFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stBoomDefense)
         {
            stFieldGrid.m_stBoomDefense.m_iDieType = 1;
            stFieldGrid.m_stBoomDefense.a_3969(stFieldGrid.m_stBoomDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stFlowerDefense)
         {
            stFieldGrid.m_stFlowerDefense.m_iDieType = 1;
            stFieldGrid.m_stFlowerDefense.a_3969(stFieldGrid.m_stFlowerDefense.iLifeValue);
         }
         if(null != stFieldGrid.m_stBaseAuxiliaryFighter)
         {
            stFieldGrid.m_stBaseAuxiliaryFighter.m_iDieType = 1;
            stFieldGrid.m_stBaseAuxiliaryFighter.a_3969(stFieldGrid.m_stBaseAuxiliaryFighter.iLifeValue);
         }
         if(null != stFieldGrid.m_stTrayDefense)
         {
            stFieldGrid.m_stTrayDefense.m_iDieType = 1;
            stFieldGrid.m_stTrayDefense.a_3969(stFieldGrid.m_stTrayDefense.iLifeValue);
         }
         return true;
      }
      
      public function SetMapFans(stMapFans:Function) : void
      {
         this.m_stMapFans = stMapFans;
      }
      
      public function a_4177() : Boolean
      {
         var res:ComMapRes = null;
         var bmp:Bitmap = null;
         var j:int = 0;
         var i:int = 0;
         var len:int = 0;
         var stVolcanicFireEffect:VolcanicFireEffect = null;
         var stSkyAirShipFansEffect:FansEffect = null;
         var air:ComAirRes = null;
         for each(res in this.m_dictLoadComposite)
         {
            if(Boolean(res) && Boolean(res.m_pBitmapData))
            {
            }
         }
         while(this.m_vObstacleImage.length > 0)
         {
            bmp = this.m_vObstacleImage.pop();
            if(bmp.parent)
            {
               bmp.parent.removeChild(bmp);
            }
            ObjectPool.CheckIn(bmp);
         }
         if(this.m_bIsSnowMap)
         {
            SnowMapManager.getInstance().a_4177();
         }
         if(this.m_stCurrentBattleFieldView)
         {
            for(i = 0; i < 7; i++)
            {
               for(j = 0; j < 9; j++)
               {
                  this.SetFieldGridData(this.m_stCurrentBattleFieldView.stFieldGridsVector[i][j],0,i,j);
                  if(ms_arrVolcanicFireEffects[i][j])
                  {
                     stVolcanicFireEffect = ms_arrVolcanicFireEffects[i][j];
                     stVolcanicFireEffect.a_3940();
                     ms_arrVolcanicFireEffects[i][j] = null;
                  }
               }
            }
            for(i = 0; i < 7; i++)
            {
               for(j = 0; j < 9; j++)
               {
                  this.SetFieldGridData(this.m_stCurrentBattleFieldView.stFieldGridsVector[i][j],0,i,j);
                  if(ms_arrSkyAirShipFansEffect[i][j])
                  {
                     stSkyAirShipFansEffect = ms_arrSkyAirShipFansEffect[i][j];
                     stSkyAirShipFansEffect.a_3940();
                     ms_arrSkyAirShipFansEffect[i][j] = null;
                  }
               }
            }
         }
         while(this.m_stAirSp.numChildren > 0)
         {
            air = this.m_stAirSp.removeChildAt(0) as ComAirRes;
            ObjectPool.CheckIn(air);
         }
         return true;
      }
      
      private function OnTimeIntervalByDesert(iTimeNum:int) : void
      {
         var createIndex:int = 0;
         var arr:Array = null;
         var max:int = 0;
         var i:int = 0;
         if(this.m_stComMapData.tornado_time != -1 && this.m_stComMapData.tornado_num > 0 && iTimeNum % (this.m_stComMapData.tornado_time * 20) == 0)
         {
            createIndex = this.groupCreateTick % this.groupMAX;
            arr = BattleRandomUtil.ShuffleArray(this.group[createIndex],this.m_stRandomSeed);
            max = Math.min(arr.length,this.m_stComMapData.tornado_num);
            for(i = 0; i < max; i++)
            {
               this.addTornadoShot(arr[i]);
            }
            ++this.groupCreateTick;
         }
      }
      
      private function addTornadoShot(gridData:FieldGridData) : void
      {
         var stStartFieldGrid:a_3491 = null;
         var stLastWaitShot:a_4348 = null;
         var move_speed:int = a_3491.a_1080 / (1 * 20);
         stStartFieldGrid = this.m_stCurrentBattleFieldView.a_3438(gridData.x,gridData.y);
         if(stStartFieldGrid)
         {
            stLastWaitShot = TornadoShot.a_4344();
            stLastWaitShot.iShotSequenceNum = gridData.tornado_type;
            if(gridData.tornado_type == 6 || gridData.tornado_type == 7 || gridData.tornado_type == 8)
            {
               stLastWaitShot.a_1797(1000,move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 3,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 32,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            }
            else
            {
               stLastWaitShot.a_1797(1000,move_speed,1000000,stStartFieldGrid.m_iXGridNo * a_3491.a_1080 + 30,stStartFieldGrid.m_iYGridNo * a_3491.a_1081 + 32,stStartFieldGrid.m_stCurrentBattbleFieldView,stStartFieldGrid);
            }
            this.m_stCurrentBattleFieldView.AddToBattleView(stLastWaitShot,BattleLayerDefine.SHOT_TYPE);
         }
      }
   }
}

