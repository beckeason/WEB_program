module.exports={
    assetsDir: 'static',
    devServer:{
        port:80,
        proxy:{
            '/api':{
                target:'http://8.134.204.159:9090',
                changeOrigin:true,
                pathRewrite:{
                    'api':''
                }
            }
        }
    }
}