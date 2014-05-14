using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Nwd.BackOffice.Impl;
using Nwd.BackOffice.Model;

namespace MVC.Controllers
{
    public class AlbumController : Controller
    {
        //
        // GET: /Album/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListeAlbums()
        {
            ViewBag.Message = "Liste des albums.";
            
            AlbumRepository ar = new AlbumRepository();
            List<Album> listeAlbums = ar.GetAllAlbums();

            return View(listeAlbums);
        }

        [HttpPost]
        public ActionResult Create(Album model)
        {
            AlbumRepository ar = new AlbumRepository();

            ar.CreateAlbum(model, this.Server);

            ViewBag.AlbumCreated = true;

            return View();
        }

        public ActionResult Create()
        {

            ViewBag.Message = "Création d'un album.";

            ViewBag.AlbumCreated = false;

            return View();
        }

        public ActionResult Delete(int id)
        {
            AlbumRepository ar = new AlbumRepository();

            ar.DeleteAlbum(id);

            return View();
        }
	}
}