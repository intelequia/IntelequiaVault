using DotNetNuke.Web.Api;

namespace Intelequia.Secure.Spa.Services
{
    public class ServiceRouteMapper : IServiceRouteMapper
    {

        /// <summary>
        /// RegisterRoutes is used to register the module's routes
        /// </summary>
        /// <param name="mapRouteManager"></param>
        public void RegisterRoutes(IMapRoute mapRouteManager)
        {
            mapRouteManager.MapHttpRoute("Intelequia/Secure", "default", "/{controller}/{action}", new[] { "Intelequia.Secure.Spa.Services" });
        }

    }
}