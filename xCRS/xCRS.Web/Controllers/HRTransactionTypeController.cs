using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using xCRS.Entities.Models;

namespace xCRS.Web.Controllers
{
    public class HRTransactionTypeController : ApiController
    {
        private xCRSContext db = new xCRSContext();

        // GET api/HRTransactionType
        public IEnumerable<HRTransactionType> GetHRTransactionTypes()
        {
            return db.HRTransactionTypes.AsEnumerable();
        }

        // GET api/HRTransactionType/5
        public HRTransactionType GetHRTransactionType(int id)
        {
            HRTransactionType hrtransactiontype = db.HRTransactionTypes.Find(id);
            if (hrtransactiontype == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return hrtransactiontype;
        }

        // PUT api/HRTransactionType/5
        public HttpResponseMessage PutHRTransactionType(int id, HRTransactionType hrtransactiontype)
        {
            if (ModelState.IsValid && id == hrtransactiontype.id)
            {
                db.Entry(hrtransactiontype).State = EntityState.Modified;

                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound);
                }

                return Request.CreateResponse(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // POST api/HRTransactionType
        public HttpResponseMessage PostHRTransactionType(HRTransactionType hrtransactiontype)
        {
            if (ModelState.IsValid)
            {
                db.HRTransactionTypes.Add(hrtransactiontype);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, hrtransactiontype);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = hrtransactiontype.id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/HRTransactionType/5
        public HttpResponseMessage DeleteHRTransactionType(int id)
        {
            HRTransactionType hrtransactiontype = db.HRTransactionTypes.Find(id);
            if (hrtransactiontype == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.HRTransactionTypes.Remove(hrtransactiontype);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, hrtransactiontype);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}