class Admin::XmlsController < Admin::BaseController

  def index
    @cosmetics = Cosmetic.order_by_created.all
    respond_to do |format|
      format.html
      format.xls { send_data @cosmetics.to_xls(col_sep: "\t") }
    end
  end
end
