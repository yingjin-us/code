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
    public class HRTransactionController : ApiController
    {
        private xCRSContext db = new xCRSContext();

        // GET api/HRTransaction
        public IEnumerable<HRTransaction> GetHRTransactions()
        {
            var hrtransactions = db.HRTransactions.Include(h => h.HRTransactionType);
            return hrtransactions.AsEnumerable();
        }

        // GET api/HRTransaction/5
        public HRTransaction GetHRTransaction(int id)
        {
            HRTransaction hrtransaction = db.HRTransactions.Find(id);
            if (hrtransaction == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return hrtransaction;
        }

        // PUT api/HRTransaction/5
        public HttpResponseMessage PutHRTransaction(int id, HRTransaction hrtransaction)
        {
            if (ModelState.IsValid && id == hrtransaction.id)
            {
                db.Entry(hrtransaction).State = EntityState.Modified;

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

        // POST api/HRTransaction
        public HttpResponseMessage PostHRTransaction(HRTransaction hrtransaction)
        {
            if (ModelState.IsValid)
            {
                db.HRTransactions.Add(hrtransaction);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, hrtransaction);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = hrtransaction.id }));
                return response;
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
        }

        // DELETE api/HRTransaction/5
        public HttpResponseMessage DeleteHRTransaction(int id)
        {
            HRTransaction hrtransaction = db.HRTransactions.Find(id);
            if (hrtransaction == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            db.HRTransactions.Remove(hrtransaction);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound);
            }

            return Request.CreateResponse(HttpStatusCode.OK, hrtransaction);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}