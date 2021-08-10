﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Master.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SodetsoUsersManagement.Models.MacroListModel>>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
              <%: ViewBag.PageTitle = "Macro PO Summary CheckList" %>
                </asp:Content>

                    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

                          <!-- row -->
                          <div class="row">
                              <div class="col-md-6">
                                  <% if (TempData["Success"] != null)
                                    { %>
                                    <div class="alert alert-success alert-dismissable">
                                    <i class="fa fa-check"></i>
                                     <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                   <b>Alert!</b> Success.  
                                   </div>
                               <% } %>
                              </div>
                            </div>
                     <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">

                <!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table id="example1" class="table table-bordered table-hover" >
                        <thead>
                            <tr>
                                <th>Po&nbsp;No.</th>              
                                <th>Item&nbsp;Code</th>                  
                                <th>Description</th>
                                <th>Supplier</th>
                                <th>UOM</th>
                                <th>Qty.&nbsp;Ordered</th>
                                <th class="<%: Session["Position"] %>">Actual.&nbsp;Delivered</th>
                                <th>Actual.&nbsp;Good</th>
                                <th class="<%: Session["Position"] %>">Actual.&nbsp;Reject</th>
                                <th class="<%: Session["Position"] %>">Qty.&nbsp;Remaining</th>
                                <th>Actual.&nbsp;Remaining</th>
                                <th class="<%: Session["Position"] %>" style="text-align:center">Rejection</th>
                                <th class="<%: Session["Position"] %>">Status</th>
                                <th style="text-align:center">Edit</th>
                                <th style="text-align:center">Cancel</th>
                                <th class="<%: Session["Position"] %>">Dispose</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% foreach (var item in Model)
                               {%>
                            <tr>
                                <td>
        <%--   <td class="headcol">--%>
                                    <%: @Html.DisplayFor(m => item.po_number) %>
                                </td>
                      
                                <td><%: Html.DisplayFor(m => item.item_code) %></td>
                          
                                <td class=><%: Html.DisplayFor(m => item.item_description) %></td>
                                <td><%: Html.DisplayFor(m => item.vendor_name) %></td>
                                <td><%: Html.DisplayFor(m => item.qty_uom) %></td>
                                <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_ordered) %></b></td>
                                <td id="agent_commission_model" class="<%: Session["Position"] %>"><%: Html.DisplayFor(m => item.qty_delivered) %></td>
                                <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_good) %></b></td>
                                <td class="<%: Session["Position"] %>"><%: Html.DisplayFor(m => item.qty_void) %></td>
                                <td class="<%: Session["Position"] %>"><%: Html.DisplayFor(m => item.qty_waiting) %></td>
                                <td id="agent_commission_model"><b><%: Html.DisplayFor(m => item.qty_remarks) %></b></td>
                                                     
                     <td class="<%: Session["Position"] %>" style="text-align:center" <%--class="<%: Session["Position"] %>"--%>>
                                    <% if (item.checklist_approval == "Rejection") 
                                    { %>                                    
                                        <%--<span class="label label-primary">Active</span>--%>

                                        <a href="#DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Confirm</span></a>
                                        
                                        <!-- Deactvate User Modal -->
                                        <div class="modal fade" id="DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"> Deactivate User</h4>
                                                    </div>
                                                    <% using (Html.BeginForm("DeactivateActivateRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                    { %>
                                                        <div class="modal-body">
                                                           Are you sure you want to deactivate the Macro Raw Material? <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                            <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                           <input type="hidden" name="Operation" value="Deactivate" />
                                                        </div>
                                                        <div class="modal-footer clearfix"> 
                                                             <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                             <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                        </div>
                                                    <% }%>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.Disable User modal -->

                                    <% }
                                    else
                                    { %>
                                    <a href="#ActivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-success">None</span></a>

                                    <!-- Activate User Modal -->
                                    <div class="modal fade" id="#ActivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title"> Activate User</h4>
                                                </div>
                                                <% using (Html.BeginForm("DeactivateActivateRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                { %>
                                                    <div class="modal-body">
                                                        Are you sure you want to Activate the User <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                        <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                        <input type="hidden" name="Operation" value="Activate" />
                                                    </div>
                                                    <div class="modal-footer clearfix"> 
                                                            <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                    </div>
                                                <% }%>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.Activate User modal -->
                                    <% } %> 
                                </td>

                                <td class="<%: Session["Position"] %>" style="text-align:center">
                                    <% if (item.IsArchived == 1) 
                                    { %>                                    
                                        <%--<span class="label label-primary">Active</span>--%>

                                        <a href="#DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-success">Active</span></a>
                                        
                                        <!-- Deactvate User Modal -->
                                        <div class="modal fade" id="DeactivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"> Deactivate User</h4>
                                                    </div>
                                                    <% using (Html.BeginForm("DeactivateActivateRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                    { %>
                                                        <div class="modal-body">
                                                           Are you sure you want to deactivate the Raw Material <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                            <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                           <input type="hidden" name="Operation" value="Deactivate" />
                                                        </div>
                                                        <div class="modal-footer clearfix"> 
                                                             <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                             <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                        </div>
                                                    <% }%>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.Disable User modal -->

                                    <% }
                                    else
                                    { %>
                                    <a href="#ActivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-warning">Inactive</span></a>

                                    <!-- Activate User Modal -->
                                    <div class="modal fade" id="ActivateUserModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title"> Activate User</h4>
                                                </div>
                                                <% using (Html.BeginForm("DeactivateActivateRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                { %>
                                                    <div class="modal-body">
                                                        Are you sure you want to Activate the User <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                        <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                        <input type="hidden" name="Operation" value="Activate" />
                                                    </div>
                                                    <div class="modal-footer clearfix"> 
                                                            <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                    </div>
                                                <% }%>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.Activate User modal -->
                                    <% } %> 
                                </td>

                             <td style="text-align:center" class="<%: Html.DisplayFor(m => item.qty_void) %>">
                                    <a class="btn btn-xs btn-primary" href="/MacroMaterials/EditMacroRawMaterials/<%: Html.DisplayFor(m => item.po_sum_id) %>"><i class="fa fa-edit"></i></a>
                                    <%--<button class="btn btn-xs btn-primary" type="button" data-toggle="modal" data-target="#EditUser<%: Html.DisplayFor(m => item.UserID) %>"><i class="fa fa-edit"></i></button>--%>
                                    
                             </td>
                            
                                 
                                <td class="<%: Session["Position"] %>">
                                    <button class="btn btn-xs btn-danger" type="text" data-toggle="modal" data-target="#RemoveUser<%: Html.DisplayFor(m => item.po_sum_id) %>"><i class="fa fa-times fa fa-white"></i></button>
                                    
                                    <!-- Remove User Modal -->
                                        <div class="modal fade" id="RemoveUser<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"> Remove Raw Materials</h4>
                                                    </div>
                                                    <% using (Html.BeginForm("RemoveRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register"}))
                                                    { %>
                                                        <div class="modal-body">
                                                           Are you sure you want to remove the Raw Material Po Summary <strong><%: Html.DisplayFor(m => item.item_description) %> </strong>?
                                                           
                                                            <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                        </div>
                                                        <div class="modal-footer clearfix"> 
                                                             <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                             <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                        </div>
                                                    <% }%>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.Remove User modal -->
                                </td>











                                   <td style="text-align:center"<%--class="<%: Session["Position"] %>"--%>>
                                    <% if (item.checklist_approval == "Cancel") 
                                    { %>                                    
                                        <%--<span class="label label-primary">Active</span>--%>

                                        <a href="#Uncancel<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Confirm</span></a>
                                        
                                        <!-- Deactvate User Modal -->
                                        <div class="modal fade" id="Uncancel"<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title"> Deactivate User</h4>
                                                    </div>
                                                    <% using (Html.BeginForm("CancelQARawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                    { %>
                                                        <div class="modal-body">
                                                           Are you sure you want to UnCancel the Raw Material <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                            <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                           <input type="text" name="Operation" value="Approved" />
                                                        </div>
                                                        <div class="modal-footer clearfix"> 
                                                             <button type="submit" class="btn btn-primary"> Yes</button>                         
                                                             <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                        </div>
                                                    <% }%>
                                                </div><!-- /.modal-content -->
                                            </div><!-- /.modal-dialog -->
                                        </div>
                                        <!-- /.Disable User modal -->

                                    <% }
                                    else
                                    { %>
                                    <a href="#CancelModal<%: Html.DisplayFor(m => item.po_sum_id) %>" data-toggle="modal"><span class="label label-danger">Cancel</span></a>

                                    <!-- Activate User Modal -->
                                    <div class="modal fade" id="CancelModal<%: Html.DisplayFor(m => item.po_sum_id) %>" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header btn-danger">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title"> Cancel Raw Materials</h4>
                                                </div>
                                                <% using (Html.BeginForm("CancelQAMacroRawMaterials", null, FormMethod.Post, new { @class = "smart-form client-form", role = "form", id = "smart-form-register", enctype = "multipart/form-data" }))
                                                { %>
                                                    <div class="modal-body">
                                                        Are you sure you want to Cancel the Macro Raw Materials <strong><%: Html.DisplayFor(m => item.item_description) %> <%--<%: Html.DisplayFor(m => item.Middlename) %> <%: Html.DisplayFor(m => item.Lastname) %>--%></strong>?
                                                           
                                                        <input type="hidden" class="form-control" name="po_sum_id" value="<%: Html.DisplayFor(m => item.po_sum_id) %>" />
                                                        <input type="hidden" name="Operation" value="Cancels" /><br />


                                                        <select id="cars" name="checklist_remarks" class="form-control">
                                                  
                                                        <option value="CHANGE OF SUPPLIER ">CHANGE OF SUPPLIER </option>
                                                        <option value="OUT OF STOCK">OUT OF STOCK</option>
                                                                <option value="RE-PR">RE-PR</option>
                                                                       <option value="OTHERS">OTHERS</option>

                                                                        </select>




            <%--                    <%: Html.TextBoxFor(m => item.checklist_remarks new { @class = "form-control", @placeholder="Enter Item Description", @required = "true"}) %>--%>
 </div>

                                                    <div class="form-group">

                                            
                                    <input type="hidden" name="cancelled_po_by" value="<%: Session["Firstname"] %>&nbsp;<%: Session["Lastname"] %>" class="form-control" readonly/>


                                    </div>
                                            

                                                      
                                         
                                                    <div class="modal-footer clearfix"> 




                                                        
                                                         
                                                           <button type="submit" class="btn btn-primary"> Yes</button>   
                                                            <button type="button" class="btn btn-danger" data-dismiss="modal"> Cancel</button> 
                                                    </div>
                                                <% }%>

                                            </div><!-- /.modal-content -->

                                        </div><!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.Activate User modal -->
                                    <% } %> 
                                </td>









                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>


                        </tfoot>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
    </div>

                             <script>


                                 ///
                                 $("button").hide();




                                 $("select").change(function () {

                                     if ($(this).val()) {
                                         $("button").show();
                                     }
                                     else {
                                         $("button").hide();
                                     }

                                 });
                                 $("button").click(function () {
                                     $("input").val();
                                     $(this).hide();
                                 });



                                 //katakot mag asp
                                 function numberWithCommas(number) {
                                     var parts = number.toString().split(".");
                                     parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                     return parts.join(".");
                                 }
                                 $(document).ready(function () {
                                     $("#agent_commission_model b").each(function () {
                                         var num = $(this).text();
                                         var commaNum = numberWithCommas(num);
                                         $(this).text(commaNum);
                                     });
                                 });





                            //alert("Please enter OrderPrice !");  

                            //     Swal.fire(
                            //         'Good job!',
                            //         'You clicked the button!',
                            //         'success'
                            //     )
                             </script>

                 <style>
                .Senior.Automation{
            display:none;
        }
             .Junior.Developer{
            display:none;
        }
    </style>   
</asp:Content>
