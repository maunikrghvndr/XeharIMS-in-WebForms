/*******************************************************************************
 * Copyright 2009-2017 Amazon Services. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 *
 * You may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at: http://aws.amazon.com/apache2.0
 * This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the 
 * specific language governing permissions and limitations under the License.
 *******************************************************************************
 * Marketplace Web Service Orders
 * API Version: 2013-09-01
 * Library Version: 2018-01-01
 * Generated: Tue Dec 05 13:25:59 PST 2017
 */

using MarketplaceWebServiceOrders.Model;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Xml;
using Newtonsoft.Json;

namespace MarketplaceWebServiceOrders {

    /// <summary>
    /// Runnable sample code to demonstrate usage of the C# client.
    ///
    /// To use, import the client source as a console application,
    /// and mark this class as the startup object. Then, replace
    /// parameters below with sensible values and run.
    /// </summary>
    public class MarketplaceWebServiceOrdersSample {

        public static void Main(string[] args)
        {
            // TODO: Set the below configuration variables before attempting to run

            // Developer AWS access key
            string accessKey = "AKIAINPBNDTX74LVIUTA";

            // Developer AWS secret key
            string secretKey = "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";

            // The client application name
            string appName = "CSharpSampleCode";

            // The client application version
            string appVersion = "1.0";

            // The endpoint for region service and version (see developer guide)
            // ex: https://mws.amazonservices.com
            string serviceURL = "https://mws.amazonservices.com";

            // Create a configuration object
            MarketplaceWebServiceOrdersConfig config = new MarketplaceWebServiceOrdersConfig();
            config.ServiceURL = serviceURL;
            // Set other client connection configurations here if needed
            // Create the client itself
            MarketplaceWebServiceOrders client = new MarketplaceWebServiceOrdersClient(accessKey, secretKey, appName, appVersion, config);

            MarketplaceWebServiceOrdersSample sample = new MarketplaceWebServiceOrdersSample(client);

            // Uncomment the operation you'd like to test here
            // TODO: Modify the request created in the Invoke method to be valid

            try 
            {
                IMWSResponse response = null;
               //response = sample.InvokeGetOrder();
                // response = sample.InvokeGetServiceStatus();
               //  response = sample.InvokeListOrderItems();
                // response = sample.InvokeListOrderItemsByNextToken();
                response = sample.InvokeListOrders();
                // response = sample.InvokeListOrdersByNextToken();
                Console.WriteLine("Response:");
                ResponseHeaderMetadata rhmd = response.ResponseHeaderMetadata;
                // We recommend logging the request id and timestamp of every call.
                Console.WriteLine("RequestId: " + rhmd.RequestId);
                Console.WriteLine("Timestamp: " + rhmd.Timestamp);
                string responseXml = response.ToXML();
               // Console.WriteLine(responseXml);
                XmlDocument doc = new XmlDocument();
                doc.LoadXml(responseXml);
                string jsonText = JsonConvert.SerializeXmlNode(doc);
                Console.WriteLine(jsonText);
                Console.ReadLine();
            }
            catch (MarketplaceWebServiceOrdersException ex)
            {
                // Exception properties are important for diagnostics.
                ResponseHeaderMetadata rhmd = ex.ResponseHeaderMetadata;
                Console.WriteLine("Service Exception:");
                if(rhmd != null)
                {
                    Console.WriteLine("RequestId: " + rhmd.RequestId);
                    Console.WriteLine("Timestamp: " + rhmd.Timestamp);
                }
                Console.WriteLine("Message: " + ex.Message);
                Console.WriteLine("StatusCode: " + ex.StatusCode);
                Console.WriteLine("ErrorCode: " + ex.ErrorCode);
                Console.WriteLine("ErrorType: " + ex.ErrorType);
                throw ex;
            }
        }

        private readonly MarketplaceWebServiceOrders client;

        public MarketplaceWebServiceOrdersSample(MarketplaceWebServiceOrders client)
        {
            this.client = client;
        }

        public GetOrderResponse InvokeGetOrder()
        {
            // Create a request.
            GetOrderRequest request = new GetOrderRequest();
            string sellerId = "A11G2ANLA1XBMA";
            request.SellerId = sellerId;
           // string mwsAuthToken = "example";
           // request.MWSAuthToken = mwsAuthToken;
            List<string> amazonOrderId = new List<string>();
            request.AmazonOrderId = amazonOrderId;
            return this.client.GetOrder(request);
        }

        public GetServiceStatusResponse InvokeGetServiceStatus()
        {
            // Create a request.
            GetServiceStatusRequest request = new GetServiceStatusRequest();
            string sellerId = "example";
            request.SellerId = sellerId;
            string mwsAuthToken = "example";
            request.MWSAuthToken = mwsAuthToken;
            return this.client.GetServiceStatus(request);
        }

        public ListOrderItemsResponse InvokeListOrderItems()
        {
            // Create a request.
            ListOrderItemsRequest request = new ListOrderItemsRequest();
            string sellerId = "A11G2ANLA1XBMA";
            request.SellerId = sellerId;
            string mwsAuthToken = "example";
            request.MWSAuthToken = mwsAuthToken;
            string amazonOrderId = "111-5284464-4817009";
            request.AmazonOrderId = amazonOrderId;
            return this.client.ListOrderItems(request);
        }

        public ListOrderItemsByNextTokenResponse InvokeListOrderItemsByNextToken()
        {
            // Create a request.
            ListOrderItemsByNextTokenRequest request = new ListOrderItemsByNextTokenRequest();
            string sellerId = "example";
            request.SellerId = sellerId;
            string mwsAuthToken = "example";
            request.MWSAuthToken = mwsAuthToken;
            string nextToken = "example";
            request.NextToken = nextToken;
            return this.client.ListOrderItemsByNextToken(request);
        }

        public ListOrdersResponse InvokeListOrders()
        {
            // Create a request.
            ListOrdersRequest request = new ListOrdersRequest();
            string sellerId = "A11G2ANLA1XBMA";
            request.SellerId = sellerId;
            //string mwsAuthToken = "example";
            //request.MWSAuthToken = mwsAuthToken;
        // DateTime createdAfter = new DateTime();
           
          // request.CreatedAfter = createdAfter;
            //    DateTime createdBefore = new DateTime();
            //  request.CreatedBefore = createdBefore;
            //datetime lastupdatedafter = new datetime();
            //request.lastupdatedafter = lastupdatedafter;
            //datetime lastupdatedbefore = new datetime();
            // request.lastupdatedbefore = lastupdatedbefore;
            string format = "MMM d, yyyy h:mm:ss tt PDT";
            CultureInfo provider = CultureInfo.InvariantCulture;
            DateTime now = DateTime.Now.Add(new TimeSpan(0, -10, 0));
            DateTime createdAfter = DateTime.ParseExact("Dec 26, 2017 2:42:18 PM PDT", format, provider);
            request.CreatedAfter = createdAfter;
            request.CreatedBefore = now;
            List<string> orderStatus = new List<string>();
            request.OrderStatus = orderStatus;
            List<string> marketplaceId = new List<string>();
            marketplaceId.Add("ATVPDKIKX0DER");    
            request.MarketplaceId = marketplaceId;
            //List<string> fulfillmentChannel = new List<string>();
           // request.FulfillmentChannel = fulfillmentChannel;
           // List<string> paymentMethod = new List<string>();
           // request.PaymentMethod = paymentMethod;
            //string buyerEmail = "example";
            //request.BuyerEmail = buyerEmail;
           // string sellerOrderId = "example";
           // request.SellerOrderId = sellerOrderId;
            decimal maxResultsPerPage = 11;
            request.MaxResultsPerPage = maxResultsPerPage;
            List<string> tfmShipmentStatus = new List<string>();
            request.TFMShipmentStatus = tfmShipmentStatus;
            return this.client.ListOrders(request);
        }

        public ListOrdersByNextTokenResponse InvokeListOrdersByNextToken()
        {
            // Create a request.
            ListOrdersByNextTokenRequest request = new ListOrdersByNextTokenRequest();
            string sellerId = "example";
            request.SellerId = sellerId;
            string mwsAuthToken = "example";
            request.MWSAuthToken = mwsAuthToken;
            string nextToken = "example";
            request.NextToken = nextToken;
            return this.client.ListOrdersByNextToken(request);
        }


    }
}
