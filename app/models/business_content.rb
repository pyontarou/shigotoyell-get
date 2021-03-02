class BusinessContent < ActiveHash::Base
  self.data = [{id: 1, name: '--' },{id: 2, name: 'ソフトウェア・情報処理'}, {id: 3, name: '通信'}, {id: 4, name: 'IT・インターネット関係'}, {id: 5, name: '総合電機メーカー'}, {id: 6, name: 'PC・通信機器メーカー'}, {id: 7, name: '半導体・電子部品メーカー'}, {id: 8, name: '計測・精密機器メーカー'}, {id: 9, name: '重電・産業電機メーカー'}, {id: 10, name: '機械メーカー'}, {id: 11, name: '自動車・輸送機メーカー'}, {id: 12, name: '医療機器メーカー'}, {id: 13, name: '鉄鋼・金属メーカー'},
    {id: 14, name: '医薬品・バイオメーカー'}, {id: 15, name: '食料品メーカー'}, {id: 16, name: '総合商社'},
    {id: 17, name: 'コンサルタント・研究機関'}, {id: 18, name: '広告・デザイン・イベント'}, {id: 19, name: '建設業'},
    {id: 20, name: '製造業'}, {id: 21, name: '電機・ガス・熱供給・水道業'}, {id: 22, name: '情報通信'},
    {id: 23, name: '運輸業・郵便業'}, {id: 24, name: '卸売業・小売業'}, {id: 25, name: '金融業・保険業'},
    {id: 26, name: '教育・学習支援業'}, {id: 27, name: '医療・福祉'}, {id: 28, name: '素材関連製造'},
    {id: 29, name: '機械関連製造業'}, {id: 30, name: '木材・木製品製造業'}, {id: 31, name: '家具装備品製造業'},
    {id: 32, name: '電子部品・デバイス製造業'}, {id: 33, name: '輸送用機械器具製造業'}, {id: 34, name: '食料品製造業'},
    {id: 35, name: '農業・林業・漁業'}, {id: 36, name: '宿泊業,飲食店'}, {id: 37, name: '不動産業,物品賃貸業'},
    {id: 38, name: 'サービス業'}, {id: 39, name: '公務'}, {id: 40, name: '生活関連サービス業,娯楽業'}, {id: 41, name: 'その他'}]

  include ActiveHash::Associations
  has_many :users
  has_many :companies
end