function StringBuffer () {
    this._strings_ = new Array();
    if (typeof StringBuffer._init == "undefined") {

        StringBuffer.prototype.append = function(str) {
            this._strings_.push(str);
        };

        StringBuffer.prototype.toString = function() {
            return this._strings_.join("");
        };
        StringBuffer._init = true;
    }
}

var d1 = new Date();
var str = "";
for (var i=0; i < 100000; i++) {
    str += "text";
}
var d2 = new Date();

console.log("Concatenation with plus: "
 + (d2.getTime() - d1.getTime()) + " milliseconds");

var buffer = new StringBuffer();
d1 = new Date();
for (var i=0; i < 100000; i++) {
    buffer.append("text");
}
var result = buffer.toString();
d2 = new Date();

console.log("Concatenation with StringBuffer: "
 + (d2.getTime() - d1.getTime()) + " milliseconds");
