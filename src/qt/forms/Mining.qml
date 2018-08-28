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

     function startminingintern(msg) {
         startminingbutton.visible=false
         stopminingbutton.visible=true         
         graphsstat.opacity=1
         cyclesstat.opacity=1
         labelgraphs.opacity=1
         labelcycles.opacity=1
         setminingstatsintern(0,0)         
         animation1.playing=true
         animation1.visible=true
         animation2.visible=false
         animation3.visible=false
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
         cyclesstat.opacity=0.5
         labelgraphs.opacity=0.5
         labelcycles.opacity=0.5
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
         cyclesstat.text=cycles
     }

     startminingbutton.onClicked: startMiningSignalIntern()
     stopminingbutton.onClicked: stopMiningSignalIntern()     
     minereduced.onCheckedChanged: minereducedSignalIntern(minereduced.checked)     
     animation1.onPlayingChanged: {
         if (!startminingbutton.visible && animation1.playing==false) {
             animation2.visible=true
             animation2.playing=true
             animation1.playing=false
             animation1.visible=false
             animation3.visible=false
         }
     }
     animation2.onPlayingChanged: {
         if (!startminingbutton.visible && animation2.playing==false) {
             animation2.visible=true
             animation2.playing=true
             animation1.playing=false
             animation1.visible=false
             animation3.visible=false
         } else
         if (startminingbutton.visible && animation2.playing==false) {
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
