FROM rust:slim-buster AS rust
WORKDIR /usr/src/katbin
COPY . .
RUN cargo install --path .
# change this according to your migration settings
RUN cargo run --manifest-path migration/Cargo.toml 
RUN cp target/release/katbin ./katbin

# build tailwind
FROM node:20-slim AS tailwind
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /usr/src/katbin
COPY --from=rust /usr/src/katbin/api/templates ./api/templates
COPY --from=rust /usr/src/katbin/api/static ./api/static
COPY --from=rust /usr/src/katbin/tailwind ./tailwind
WORKDIR /usr/src/katbin/tailwind
RUN pnpm install --frozen-lockfile
RUN pnpm run build-css-prod

# final image
FROM debian:12-slim AS final
WORKDIR /usr/src/katbin
COPY --from=rust /usr/src/katbin/katbin ./
COPY --from=rust /usr/src/katbin/api/templates ./api/templates
COPY --from=tailwind /usr/src/katbin/api/static ./api/static

CMD [ "/usr/src/katbin/katbin" ]