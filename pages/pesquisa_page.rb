class PesquisaPage
    include PageObject
    require 'spec_helper'

  # ############################################################################################################
  text_field :pesquisaproduto, id: 'q'
  button :botao_submit_pesquisaproduto, class: 'submitBtn'
  elements :nome_produto, :h2, css: 'div.fnmrjs-8.kRlFBv > h2'
  elements :preco_produto, :p, css: 'div.fnmrjs-15.clbSMi > p.fnmrjs-16.jqSHIm'
  link :pagina_dois, css: '#content > div > div.col2.sc-15vff5z-5.fFdJjk > div:nth-child(12) > ul > li:nth-child(2) > a'
  link :primeiro_resultado_pag2, css: '#content > div > div.col2.sc-15vff5z-5.fFdJjk > div.sc-1fcmfeb-0.WQhDk > ul > li:nth-child(1) > a'
  # ############################################################################################################

  def pesquisar_pelo_produto        
      self.pesquisaproduto = "Notebook Dell"
      botao_submit_pesquisaproduto        
  end

  def selecionar_5_primeiros_resultados      
    i = 0
    puts '###############################################################################'
    puts '5 primeiros anúncios da pesquisa:'
    puts ' '
    loop do
        nome =  nome_produto_elements.at(i).text
        preco = preco_produto_elements.at(i).text
        num = i + 1
        puts num.to_s + '. Titulo: ' + nome + ' / Preco: ' + preco
      i+=1
      if i == 5
        break
      end
    end
    puts '###############################################################################'
  end

  def setar_aba_principal
    @original_window = @browser.window_handle
  end

  def paginacao
    pagina_dois
    primeiro_resultado_pag2
  end

  def setar_aba_em_uso
    sleep(10)
    @browser.window_handles.each do |handle|
      if handle != @original_window
        @browser.switch_to.window handle
          break
      end
    end
    sleep(10)
  end

  def gravar_tela
    @browser.save_screenshot("evidencias/produto.png")
    @browser.close
  end
end