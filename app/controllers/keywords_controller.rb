class KeywordsController < ApplicationController
    before_action :correct_user,   only: :destroy
    def create
        @keyword = Keyword.find_by(keywords_contents: params[:keyword][:keywords_contents])
        if @keyword.nil?
            #未登録のキーワードの時、登録処理を行う
            @keyword = current_user.keywords.build(keyword_params)
            if current_user.save
                flash[:success] = "キーワード登録が完了!"
                redirect_to current_user
            else
                flash[:danger] = '登録文字が20文字を越えています'
                # redirect_to current_user
                redirect_to current_user
            end
        else
            #登録済みの場合、UsersKeywordテーブルに存在するかを確認。
            @userKeyword = UsersKeyword.find_by(user_id: current_user.id , keyword_id: @keyword.id)
            if @userKeyword.nil?
                #UsersKeywordテーブルに存在しない場合、UsersKeywordテーブルに紐づけるレコードを作成
                @userKeyword = UsersKeyword.new(user_id: current_user.id , keyword_id: @keyword.id, delete_flg: false)
                @userKeyword.save
                redirect_to current_user
            else
                #UsersKeywordテーブルに存在する場合、警告
                flash[:danger] = '登録済みのキーワードです'
                redirect_to current_user
            end

        end
    end

    def destroy
        @keyword.destroy
        flash[:success] = "削除しました"
        redirect_to request.referrer || root_url
    end

        private
        def users_keywords_params
            params.require(:users_keyword).permit(current_user.id , @keyword.id ,false)
        end

        def keyword_params
            params.require(:keyword).permit(:keywords_contents)
        end
        
        def correct_user
            @keyword = current_user.keywords.find_by(id: params[:id])
            redirect_to root_url if @keyword.nil?
        end
end
