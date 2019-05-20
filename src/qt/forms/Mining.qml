import QtQuick 2.7

MiningForm {     

    id: miningform
    onHeightChanged: {
       animation1.height=miningform.height-280
       animation1.width=animation1.height*1024/768
       animation2.width=animation1.width
       animation2.height=animation1.height
       animation3.width=animation1.width
       animation3.height=animation1.height
     }
     signal startMiningSignalIntern()
     signal stopMiningSignalIntern()
     signal minereducedSignalIntern(bool isreduced)

     function makeminingpoolvisibleintern() {
        miningpoollabel.visible = true
        poolcombo.visible = true
     }

     function getminingpoolintern()
     {
         return poolcombo.currentIndex
     }

     function initmininglogintern() {
         mininglog1.visible = true
         mininglog1.text = ""
         mininglog2.visible = true
         mininglog2.text = ""
         mininglog3.visible = true
         mininglog3.text = ""
         mininglog4.visible = true
         mininglog4.text = ""
         mininglog5.visible = true
         mininglog5.text = ""
         labelgraphs.visible = false
         graphsstat.visible = false
     }

     function exitmininglogintern() {
         mininglog1.visible = false
         mininglog2.visible = false
         mininglog3.visible = false
         mininglog4.visible = false
         mininglog5.visible = false
         labelgraphs.visible = true
         graphsstat.visible = true
     }

     function mininglogintern(msg) {
         mininglog1.text = mininglog2.text
         mininglog2.text = mininglog3.text
         mininglog3.text = mininglog4.text
         mininglog4.text = mininglog5.text
         mininglog5.text = msg
     }

     function startminingintern(msg) {
         startminingbutton.visible=false
         stopminingbutton.visible=true         
         graphsstat.opacity=1         
         labelgraphs.opacity=1         
         setminingstatsintern(0,0)         
         if (!stopanimation.checked) {
             animation1.currentFrame=0
             animation2.currentFrame=0
             animation3.currentFrame=0
             animation1.playing=true
             animation1.visible=true
             animation2.visible=false
             animation3.visible=false
         }
     }

     Timer {
         id: timer
         function setTimeout(cb, delayTime) {
             timer.interval = delayTime;
             timer.repeat = false;
             timer.triggered.connect(cb);
             timer.triggered.connect(function() {
                 timer.triggered.disconnect(cb); // This is important
             });
             timer.start();
         }
     }

     function stopminingintern(msg) {
         startminingbutton.visible=true
         stopminingbutton.visible=false
         graphsstat.opacity=0.5         
         labelgraphs.opacity=0.5         
         setminingstatsintern(0,0)
         toolBar2.visible=true
         toolBar.visible=false
         text11.text="You have successfully earned "+msg+" BITC. It's been automatically added to your total balance."
         timer.setTimeout(function(){
             toolBar2.visible=false
             toolBar.visible=false
         }, 3000);
     }

     function displaymininginfointern(msg) {
         toolBar3.visible=true
         text12.text=msg
         timer.setTimeout(function(){
             toolBar3.visible=false
         }, 5000);
     }

     function setminingstatsintern(graphs,cycles) {
         graphsstat.text=graphs
     }

     stopanimation.onCheckStateChanged: {
         if (!stopanimation.checked)
         {
             if (!startminingbutton.visible)
             {
                 animation1.currentFrame=0
                 animation2.currentFrame=0
                 animation3.currentFrame=0
                 animation1.playing=true
                 animation1.visible=true
                 animation2.visible=false
                 animation3.visible=false
             }
         }
     }
     startminingbutton.onClicked: startMiningSignalIntern()
     stopminingbutton.onClicked: stopMiningSignalIntern()
     animation1.onPlayingChanged: {
         if (!startminingbutton.visible && animation1.playing==false && !stopanimation.checked) {
             animation2.visible=true
             animation2.playing=true
             animation1.playing=false
             animation1.visible=false
             animation3.visible=false
         }
     }
     animation2.onPlayingChanged: {
         if (!startminingbutton.visible && animation2.playing==false && !stopanimation.checked) {
             animation2.visible=true
             animation2.playing=true
             animation1.playing=false
             animation1.visible=false
             animation3.visible=false
         } else
         if ((startminingbutton.visible || stopanimation.checked) && animation2.playing==false) {
                 animation3.visible=true
                 animation3.playing=true
                 animation2.visible=false
                 animation2.playing=false
                 animation1.playing=false
                 animation1.visible=false
         }
     }
     animation3.onPlayingChanged: {
         if (animation3.playing==false) {
             animation1.currentFrame=0
             animation1.playing=false
             animation1.currentFrame=0
             animation1.visible=true
             animation2.visible=false
             animation3.visible=false
         }
     }
}
