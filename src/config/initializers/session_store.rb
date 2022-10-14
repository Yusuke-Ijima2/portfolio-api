Rails.application.config.session_store(
  :cookie_store,
  key: '_hoge_session',
  expire_after: 1.month
)