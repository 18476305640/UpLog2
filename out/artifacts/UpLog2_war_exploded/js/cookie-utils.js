                    (function ($,window){
                        $.extend({//封装成插件要使用方法
                            addCookie:function (key,value,day,path,domain){
                                var index=window.location.pathname.lastIndexOf("/");

                                var currentPath=window.location.pathname.slice(0,index);
                                path=path || currentPath;

                                domain=domain || document.domain;
                                if(!day){
                                    document.cookie=key+"="+value+";path="+path+";domain="+domain+";";
                                }else{
                                    var time=new Date();
                                    time.setDate(time.getDate()+day);
                                    document.cookie=key+"="+value+";expires="+time.toUTCString()+";path="+path+";domain="+domain+";";
                                }
                            },
                            getCookie:function (key){
                                var arr=document.cookie.split(";");
                                for (var i=0;i<arr.length;i++){
                                    var kv=arr[i].trim().split("=");
                                    if(kv[0].trim()==key){
                                        return kv[1];
                                    }

                                }
                            },
                            deleteCookie:function (key,path){
                                //不指定路径时，默认删除默认路径下的cookie
                                $.addCookie(key,$.getCookie(key),-1,path);

                            }
                        });
                    })(jQuery,window);