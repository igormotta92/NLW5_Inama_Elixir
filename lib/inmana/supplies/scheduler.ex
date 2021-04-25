defmodule Inmana.Supplies.Scheduler do
  # GenServer é um behavior, uma interface
  # Doc: https://hexdocs.pm/elixir/GenServer.html
  use GenServer

  alias Inmana.Supplies.ExpirationNotification

  # =============================================================
  # CLIENT

  # Iniciar o GenServer através do modulo GenServer e nao chamando a função init manualmente
  def start_link(_state) do
    GenServer.start_link(__MODULE__, %{})
  end

  # def put do
  #   GenServer.call()
  # end

  # =============================================================
  # SERVIDOR

  # Exemplo
  # {:ok, pid} = GenServer.start(Inmana.Supplies.Scheduler, %{})
  # GenServer.cast(pid, {:put, :a, 5})
  # GenServer.call(pid, {:get, :a})

  # Funções Padrões GenServer

  # Função padrão para  iniciar um estado
  # Atribuir valor default \\
  # @impl true : Deixar claro que é uma implementação de um behavior
  @impl true
  def init(state \\ %{}) do
    schedule_notification()
    {:ok, state}
  end

  # async - assíncrono
  # :noreply - sem reposta
  # modificando estado
  @impl true
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # sync - síncrono
  # :reply - com reposta
  # retorna o valor
  @impl true
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  # Receber qualquer menssagem
  @impl true
  def handle_info(_msg, state) do
    # IO.puts("Recebi")
    ExpirationNotification.send()

    schedule_notification()

    {:noreply, state}
  end

  # =============================================================
  # Exemplo de Cronjob só com Elixie

  # Agendamendo de Job's

  # init -> schedule_notification(1000 * 10) -> handle_info -> schedule_notification(1000 * 10)
  # -> schedule_notification(1000 * 10) -> handle_info -> schedule_notification(1000 * 10) -> ...

  defp schedule_notification do
    # 1000 * 60 * 60 * 24 * 7 -> Uma vez por semana
    Process.send_after(self(), :generate, 1000 * 10)
  end
end
