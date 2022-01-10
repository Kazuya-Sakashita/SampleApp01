var start = document.querySelector('#start');//再生ボタン
var stop = document.querySelector('#stop');//停止ボタン

var txtArea = document.querySelector('#speechtxt');//読み上げ箇所を指定
var speechTxt = txtArea.textContent;//読み上げ箇所のテキスト取得

start.addEventListener('click', function(){//再生
    var speechSet = new SpeechSynthesisUtterance();
    speechSet.text = speechTxt;
    speechSet.lang = 'ja-JP';
    speechSynthesis.speak(speechSet);
}, false);

stop.addEventListener('click', function(){//停止
    speechSynthesis.cancel();
}, false);