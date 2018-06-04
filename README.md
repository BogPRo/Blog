Rails 5.0.7
Ruby 2.2.6p396

Installation:
1. Git clone
2. bundle install
3. rails db:create
4. rails db:migrate
5. rails db:seed (for demo)

Admin account: vasvas@mail.com, password: 123456 (can be changed
)\
Moderator account: pet@mail.com, password: 123456 (can be changed
)\
User account: vov@mail.com, password: 123456 (can be changed
)


Блог. Ruby on Rails.\
Cоздать полноценный блог, с аутентификацией и авторизацией. Должна быть возможность добавлять статьи, комментарии к ним, должно быть пару разделов для статей.

Статьи \
1.Форма добавления должна иметь:
Select раздел (Наука, Общество, Кино и тд.)
Оглавление (Title)
Основной текст (Body)
2. Валидация формы - Раздел, Title и Body обязательные поля.
3. После сохранения статья НЕ должна сразу публиковаться, а принимать статус New и ждать пока модератор проверит ее и поменяет статус на Accepted или Rejected.
4. Статусы статьи:
New (новая статья, ожидает проверки)
Accepted (статья была проверина и принята, после чего ее видно в основном разделе)
Rejected (статья проверена и отклонена модератором, в основной раздел не попадает, но автор статьи может ее изменить и отправить снова на модерацию)
Pending (статья была изменена автором и повторно отправлена на модерацию после Rejected)

Аутентификация
Поля входа: Email и Password

Авторизация
Есть 3 вида роли для пользователей:\
*Author (автор статьи, может создавать статьи и редактировать только свои, после логина может видеть список всех своих статьей и их статусы)\
*Moderator (модератор не может редактировать и не может удалять статьи, может только их видеть и изменять статусы на Accepted и Rejected, после логина видит свисок статьей только со статусом New и Pending)\
*Admin (администрато после логина видит все статьи всех авторов, может удалять любую статью)
