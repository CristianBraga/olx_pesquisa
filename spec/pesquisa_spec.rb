Bundler.require :default
require 'spec_helper'
require 'require_all'
require_all 'pages'

describe 'Teste Aceitação', :olx_pesquisa do
  context 'Product' do
    it 'Proposta 1' do
      visit('OlxPage')
      on PesquisaPage do |pesq_page|
        pesq_page.pesquisar_pelo_produto
        pesq_page.selecionar_5_primeiros_resultados
      end
    end
    it 'Proposta 2' do
      visit('OlxPage')
      on PesquisaPage do |pesq_page|
        pesq_page.pesquisar_pelo_produto
        pesq_page.setar_aba_principal
        pesq_page.paginacao
        pesq_page.setar_aba_em_uso
        pesq_page.gravar_tela
      end
    end
  end
end