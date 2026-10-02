package com.aurora.ui.maogoutd.game
{
   import com.aurora.ui.maogoutd.ClientLog.ReportHandler;
   import com.aurora.ui.maogoutd.resource.effect.BattleAdd30ScoreEffect;
   import com.aurora.ui.maogoutd.resource.effect.BattleAdd40ScoreEffect;
   import com.aurora.ui.maogoutd.resource.effect.BattleAdd50ScoreEffect;
   import com.aurora.ui.maogoutd.resource.effect.BattleSub100ScoreEffect;
   import com.aurora.ui.maogoutd.resource.effect.BattleSub50ScoreEffect;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class BattleScoreView extends Sprite
   {
      
      public var m_stGreenScoreNumberView:BattleGreenScoreNumberView;
      
      public var m_stRedScoreNumberView:BattleRedScoreNumberView;
      
      private var m_iMyTeamScore:int = 0;
      
      private var m_iOppTeamScore:int = 0;
      
      public var m_stReportBtn:SimpleButton;
      
      public var m_stReportView:ReportView;
      
      public function BattleScoreView()
      {
         super();
         this.m_stReportView.visible = false;
         this.m_stGreenScoreNumberView = new BattleGreenScoreNumberView();
         this.m_stRedScoreNumberView = new BattleRedScoreNumberView();
         this.m_stReportBtn.addEventListener(MouseEvent.CLICK,this.OnClickReportHandler);
         addChild(this.m_stGreenScoreNumberView);
         addChild(this.m_stRedScoreNumberView);
      }
      
      private function OnClickReportHandler(e:Event) : void
      {
         if(this.m_stReportView.visible)
         {
            this.m_stReportView.visible = false;
         }
         else
         {
            this.m_stReportView.a_3014();
         }
      }
      
      public function a_3473(iMyTeamScore:int, iOppTeamScore:int, iMapID:int) : Boolean
      {
         var stBattleAdd30ScoreEffect:BattleAdd30ScoreEffect = null;
         var stBattleAdd40ScoreEffect:BattleAdd40ScoreEffect = null;
         var stBattleAdd50ScoreEffect:BattleAdd50ScoreEffect = null;
         var stBattleSub50ScoreEffect:BattleSub50ScoreEffect = null;
         var stBattleSub100ScoreEffect:BattleSub100ScoreEffect = null;
         if(ReportHandler.REPORT_STATE_REQUEST == ReportHandler.Get().m_iReportState)
         {
            ReportHandler.Get().OnRequestReportTime();
         }
         if(ReportHandler.Get().m_bIsVs && ReportHandler.REPORT_STATE_ALLOW == ReportHandler.Get().m_iReportState)
         {
            this.m_stReportBtn.visible = true;
            ReportHandler.Get().m_strInfo = "my_score:" + iMyTeamScore + "|op score:" + iOppTeamScore;
         }
         else
         {
            this.m_stReportBtn.visible = false;
         }
         if((iMapID & 0xFF000000) == 1358954496)
         {
            this.m_stReportBtn.visible = false;
         }
         if(this.m_stRedScoreNumberView.a_1797(iMyTeamScore) && this.m_stGreenScoreNumberView.a_1797(iOppTeamScore))
         {
            this.m_stRedScoreNumberView.x = 2 + 0.5 * (120 - this.m_stGreenScoreNumberView.width);
            this.m_stRedScoreNumberView.y = 0.5 * (36 - this.m_stGreenScoreNumberView.height);
            this.m_stGreenScoreNumberView.x = 160 + 0.5 * (120 - this.m_stRedScoreNumberView.width);
            this.m_stGreenScoreNumberView.y = 0.5 * (40 - this.m_stRedScoreNumberView.height);
            if(30 == iMyTeamScore - this.m_iMyTeamScore)
            {
               stBattleAdd30ScoreEffect = BattleAdd30ScoreEffect.a_3926();
               stBattleAdd30ScoreEffect.a_1797(false);
               stBattleAdd30ScoreEffect.x = 20;
               addChild(stBattleAdd30ScoreEffect);
               stBattleAdd30ScoreEffect.play();
            }
            else if(40 == iMyTeamScore - this.m_iMyTeamScore)
            {
               stBattleAdd40ScoreEffect = BattleAdd40ScoreEffect.a_3926();
               stBattleAdd40ScoreEffect.a_1797(false);
               stBattleAdd40ScoreEffect.x = 20;
               addChild(stBattleAdd40ScoreEffect);
               stBattleAdd40ScoreEffect.play();
            }
            else if(50 == iMyTeamScore - this.m_iMyTeamScore)
            {
               stBattleAdd50ScoreEffect = BattleAdd50ScoreEffect.a_3926();
               stBattleAdd50ScoreEffect.a_1797(false);
               stBattleAdd50ScoreEffect.x = 20;
               addChild(stBattleAdd50ScoreEffect);
               stBattleAdd50ScoreEffect.play();
            }
            else if(-50 == iMyTeamScore - this.m_iMyTeamScore)
            {
               stBattleSub50ScoreEffect = BattleSub50ScoreEffect.a_3926();
               stBattleSub50ScoreEffect.a_1797(false);
               stBattleSub50ScoreEffect.x = 20;
               addChild(stBattleSub50ScoreEffect);
               stBattleSub50ScoreEffect.play();
            }
            else if(-100 == iMyTeamScore - this.m_iMyTeamScore)
            {
               stBattleSub100ScoreEffect = BattleSub100ScoreEffect.a_3926();
               stBattleSub100ScoreEffect.a_1797(false);
               stBattleSub100ScoreEffect.x = 20;
               addChild(stBattleSub100ScoreEffect);
               stBattleSub100ScoreEffect.play();
            }
            if(30 == iOppTeamScore - this.m_iOppTeamScore)
            {
               stBattleAdd30ScoreEffect = BattleAdd30ScoreEffect.a_3926();
               stBattleAdd30ScoreEffect.a_1797(false);
               stBattleAdd30ScoreEffect.x = 200;
               addChild(stBattleAdd30ScoreEffect);
               stBattleAdd30ScoreEffect.play();
            }
            else if(40 == iOppTeamScore - this.m_iOppTeamScore)
            {
               stBattleAdd40ScoreEffect = BattleAdd40ScoreEffect.a_3926();
               stBattleAdd40ScoreEffect.a_1797(false);
               stBattleAdd40ScoreEffect.x = 200;
               addChild(stBattleAdd40ScoreEffect);
               stBattleAdd40ScoreEffect.play();
            }
            else if(50 == iOppTeamScore - this.m_iOppTeamScore)
            {
               stBattleAdd50ScoreEffect = BattleAdd50ScoreEffect.a_3926();
               stBattleAdd50ScoreEffect.a_1797(false);
               stBattleAdd50ScoreEffect.x = 200;
               addChild(stBattleAdd50ScoreEffect);
               stBattleAdd50ScoreEffect.play();
            }
            else if(-50 == iOppTeamScore - this.m_iOppTeamScore)
            {
               stBattleSub50ScoreEffect = BattleSub50ScoreEffect.a_3926();
               stBattleSub50ScoreEffect.a_1797(false);
               stBattleSub50ScoreEffect.x = 200;
               addChild(stBattleSub50ScoreEffect);
               stBattleSub50ScoreEffect.play();
            }
            else if(-100 == iOppTeamScore - this.m_iOppTeamScore)
            {
               stBattleSub100ScoreEffect = BattleSub100ScoreEffect.a_3926();
               stBattleSub100ScoreEffect.a_1797(false);
               stBattleSub100ScoreEffect.x = 200;
               addChild(stBattleSub100ScoreEffect);
               stBattleSub100ScoreEffect.play();
            }
            if(stBattleAdd30ScoreEffect)
            {
               stBattleAdd30ScoreEffect.y = -10;
            }
            if(stBattleAdd40ScoreEffect)
            {
               stBattleAdd40ScoreEffect.y = -10;
            }
            if(stBattleAdd50ScoreEffect)
            {
               stBattleAdd50ScoreEffect.y = -10;
            }
            if(stBattleSub50ScoreEffect)
            {
               stBattleSub50ScoreEffect.y = -10;
            }
            if(stBattleSub100ScoreEffect)
            {
               stBattleSub100ScoreEffect.y = -10;
            }
            this.m_iMyTeamScore = iMyTeamScore;
            this.m_iOppTeamScore = iOppTeamScore;
            return true;
         }
         return false;
      }
   }
}

