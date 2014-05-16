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

        public ActionResult Edit(int id)
        {

            ViewBag.Message = "Edition d'un album.";
            ViewBag.AlbumEdited = false;
            AlbumRepository ar = new AlbumRepository();

            Album albumToEdit = ar.GetAlbumForEdit(id);

            return View(albumToEdit);
        }

        [HttpPost]
        public ActionResult Edit(Album model)
        {
            ViewBag.Message = "Edition d'un album.";

            AlbumRepository ar = new AlbumRepository();

            Album albumToEdit = ar.EditAlbum(this.Server, model);
            
            ViewBag.AlbumEdited = true;

            return View();
        }

        public void Delete(int id)
        {
            AlbumRepository ar = new AlbumRepository();

            ar.DeleteAlbum(id);

            this.Response.RedirectToRoute(new { controller = "Album", action = "ListeAlbums" });
        }
	}
}