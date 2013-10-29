using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace xCRS.Web
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            config.EnableQuerySupport(); // YJ, 4/17/13, enable OData URI query syntax
        }
    }
}
