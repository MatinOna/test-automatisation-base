function() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var baseApiUrl = 'http://bp-se-test-cabcd9b246a5.herokuapp.com/mpona/api/characters';
  var config = {
    env: env,
    urlBase: baseApiUrl,
    urlBaseId: function(id) { return baseApiUrl + '/' + id; },

  };
  if (env == 'test') {
    config.urlBase = baseApiUrl;
    config.urlBaseId = function(id) { return baseApiUrl + '/' + id; };

    // e.g. config.foo = 'bar';
  } else if (env == 'prod') {
    config.urlBase = baseApiUrl;
    config.urlBaseId = function(id) { return baseApiUrl + '/' + id; };

  }
  karate.configure('connectTimeout', 15000);
  karate.configure('readTimeout', 15000);
  karate.configure('ssl', { trustAll: true });
  return config;
}
