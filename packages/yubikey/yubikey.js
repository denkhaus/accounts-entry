var yub = Npm.require('yub');
var Future = Npm.require('fibers/future');

YubikeyAPI = function(clientId, clientSecret) {
  this.yubiAPI = yub.init(clientId, clientSecret);
}

YubikeyAPI.prototype.listSubscribe = function(otp) {
  var future = new Future();
  this.yubiAPI.verify(otp, function(err, res) {
    if (err) {
      future.throw(err);
    } else {
      future.return(res);
    }
  });

  return future.wait();
}
