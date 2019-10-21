class KeywordsController < ApplicationController
    before_action :logged_in_user
    before_action :correct_user,   only: :destroy
    def index
        @keyword = Keyword.new

        users_keywords = current_user.users_keywords.where(delete_flg: false)
        keyword_ids = users_keywords.map {|uk| uk.keyword_id}
        @keywords = Keyword.find(keyword_ids)
    end

    def edit
    end

    def show
        @keyword = Keyword.find(params[:id])
    end

    def create
        @keyword = Keyword.find_by(name: params[:keyword][:name])
        if @keyword.nil?
            #未登録のキーワードの時、登録処理を行う
            @keyword = current_user.keywords.build(keyword_params)
            if current_user.save
                flash[:success] = "キーワード登録が完了!"
                redirect_to keywords_url
            else
                flash[:danger] = '登録文字が20文字を越えています'
                redirect_to keywords_url
            end
        else
            #登録済みの場合、UsersKeywordテーブルに存在するかを確認。
            @userKeyword = UsersKeyword.find_by(user_id: current_user.id , keyword_id: @keyword.id)
            if @userKeyword.nil?
                #UsersKeywordテーブルに存在しない場合、UsersKeywordテーブルに紐づけるレコードを作成
                @userKeyword = UsersKeyword.new(user_id: current_user.id , keyword_id: @keyword.id, delete_flg: false)
                @userKeyword.save
                redirect_to keywords_url
            else
                #UsersKeywordテーブルに存在する場合、警告
                flash[:danger] = '登録済みのキーワードです'
                redirect_to keywords_url
            end
        end
    end

    def destroy
        @userKeyword.destroy
        flash[:success] = "削除しました"
        redirect_to request.referrer || root_url
    end

        private
        def users_keywords_params
            params.require(:users_keyword).permit(current_user.id , @keyword.id ,false)
        end

        def keyword_params
            params.require(:keyword).permit(:name)
        end
        
        def correct_user
            @userKeyword = current_user.users_keywords.find_by(keyword_id: params[:id])
            redirect_to root_url if @userKeyword.nil?
        end
end
