# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["SampleSignalR.csproj", "./"]
RUN dotnet restore "SampleSignalR.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet build "SampleSignalR.csproj" -c Release -o /app/build

# Etapa 2: Publish da aplicação
FROM build AS publish
RUN dotnet publish "SampleSignalR.csproj" -c Release -o /app/publish

# Etapa 3: Execução da aplicação
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SampleSignalR.dll"]
