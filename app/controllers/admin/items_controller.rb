# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'pw'

    before_action :set_item, only: %i[edit update destroy]

    def index
      @items = Item.all.order(:id)
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)

      if @item.save
        flash[:success] = "商品「#{@item.name}」を登録しました。"
        redirect_to admin_items_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @item.update(item_params)
        flash[:success] = "商品「#{@item.name}」を更新しました。"
        redirect_to admin_items_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @item.destroy

      redirect_to admin_items_path, success: "商品 #{@item.name} は削除されました。", status: :see_other
    end

    private

    def item_params
      params.require(:item).permit(:name, :price, :introduction, :image)
    end

    def set_item
      @item = Item.find(params[:id])
    end
  end
end
